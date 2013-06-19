class PurchaseRequisitionsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :inventory_management_system, :except => [:show]
  layout "sheetbox", :only => [:new, :create, :edit, :update, :show]

  def index
    @search = PurchaseRequisition.search(params[:search])
    @purchase_requisitions = PurchaseRequisition.search_purchase_requisitions(@search)
    @purchase_requisitions = @purchase_requisitions.where(:department_id => current_user.department_id) unless user_is_admin?
    @purchase_requisitions = @purchase_requisitions.paginate(:page => params[:page])
    loading
  end
  
  def kiv
    @search = PurchaseRequisition.search(params[:search])
    @purchase_requisitions = PurchaseRequisition.search_purchase_requisitions_kiv(@search)
    @purchase_requisitions = @purchase_requisitions.where(:department_id => current_user.department_id) unless user_is_admin?
    @purchase_requisitions = @purchase_requisitions.paginate(:page => params[:page])
    loading
  end
  
  def show
    loading_logic(params[:id])
    @show_items = @purchase_requisition.purchase_requisition_items
  end

  def new
    @purchase_requisition = PurchaseRequisition.new
    @pending = current_user.purchase_requisition_items.where("status = ?", PurchaseRequisitionItem::PENDING)
  end

  def create
    @purchase_requisition = PurchaseRequisition.new(params[:purchase_requisition])
    @manage, msg = PurchaseRequisition.managing_validate(current_user, params[:select_items])   # Validate should checking whether select items and ETA date are valid?
    PurchaseRequisitionManagement.arrange(current_user, @purchase_requisition, director_data) if @manage.present?
    if @manage.present? && @purchase_requisition.save
      company.update_attributes!(:sn_purchase_req_no => @purchase_requisition.pr_no)
      PurchaseRequisitionManagement.run_update(current_user, @purchase_requisition, params[:select_items])
      redirect_to new_purchase_requisition_path, notice: "PR No # #{@purchase_requisition.pr_no} has #{@purchase_requisition.purchase_requisition_items.size} items was created."
    else
      msg = [] unless msg.present?
      msg << @purchase_requisition.errors.full_messages if @purchase_requisition.errors
      flash[:alert] = msg.join(", ")
      new
      render action: "new"
    end
  end
  
  def edit
    loading_logic(params[:id])
    @edit_items = @purchase_requisition.purchase_requisition_items
    @app_lvl2 = User.find(@purchase_requisition.approved_by_level_two)    if @purchase_requisition.approved_by_level_two.present?
    @app_lvl3 = User.find(@purchase_requisition.approved_by_level_three)  if @purchase_requisition.approved_by_level_three.present?
    @app_lvl4 = User.find(@purchase_requisition.approved_by_level_five)   if @purchase_requisition.approved_by_level_five.present?
  end

  def update
    @purchase_requisition = PurchaseRequisition.find(params[:id])

    respond_to do |format|
      if @purchase_requisition.update_attributes!(params[:purchase_requisition])
        format.html { redirect_to @purchase_requisition, notice: 'Purchase requisition was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @purchase_requisition.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @purchase_requisition = PurchaseRequisition.find(params[:id])
    @purchase_requisition.update_attributes(:status => PurchaseRequisition::KEEP_IN_VIEW, :recover_status => @purchase_requisition.status)
    redirect_to purchase_requisitions_path, :notice => "PR No # #{@purchase_requisition.pr_no} has dropped to KIV."
  end
  
  def recover
    @purchase_requisition = PurchaseRequisition.find(params[:id])
    @purchase_requisition.update_attributes(:status => @purchase_requisition.recover_status, :recover_status => "")
    redirect_to kiv_purchase_requisitions_path, :notice => "PR No # #{@purchase_requisition.pr_no} has recovered from KIV."
  end
  
  def signature_report
    if user_is_admin?
      @user_report = PurchaseRequisition.where("status = ? or status = ? or status = ?", PurchaseRequisition::LEVEL_FIVE, PurchaseRequisition::LEVEL_THREE, PurchaseRequisition::LEVEL_TWO)
    else
      @user_report = current_user.prs.where("status != ?", PurchaseRequisition::KEEP_IN_VIEW)
    end
    @user_report = @user_report.paginate(:page => params[:page])
  end
  
  def yes_approval_requester
    @app_req = PurchaseRequisition.find(params[:id])
    @return_obj = PurchaseRequisition.level_one_to(@app_req, director_data)
    if @app_req.update_attributes(:status => @return_obj[:status], :requested_by_date => Date.today, :tasks => @return_obj[:task], :remark => nil)
      redirect_to edit_purchase_requisition_path(@app_req), :notice => "Update Successfully."
    else
      flash[:alert] = @app_req.errors.full_messages.join(",")
      redirect_to edit_purchase_requisition_path(@app_req)
    end
  end
  
  def yes_approval_one
    @app_one = PurchaseRequisition.find(params[:id])
    @return_obj = PurchaseRequisition.level_two_to(@app_one, director_data)
    if @app_one.update_attributes(:status => @return_obj[:status], :approved_by_level_two => current_user.id, :approved_by_level_two_date => Date.today, :tasks => @return_obj[:task])
      redirect_to edit_purchase_requisition_path(@app_one), :notice => "Update Successfully."
    else
      flash[:alert] = @app_one.errors.full_messages.join(", ")
      redirect_to edit_purchase_requisition_path(@app_one)
    end
  end
  
  def no_approval_one
    @app_one = PurchaseRequisition.find(params[:id])
    params[:remark] = nil unless params[:remark].present?
    user = User.find_by_id(@app_one.requested_by)
    if @app_one.update_attributes(:status => generate_add_status(user), :remark => params[:remark], :tasks => user.id)
      redirect_to edit_purchase_requisition_path(@app_one), :notice => "Update Successfully."
    else
      flash[:alert] = @app_one.errors.full_messages.join(",")
      redirect_to edit_purchase_requisition_path(@app_one)
    end
  end
  
  def yes_approval_om
    @app_om = PurchaseRequisition.find(params[:id])
    if @app_om.update_attributes(:status => PurchaseRequisition::LEVEL_FIVE, :approved_by_level_three => current_user.id, :approved_by_level_three_date => Date.today, :tasks => director_data.id)
      redirect_to edit_purchase_requisition_path(@app_om), :notice => "Update Successfully."
    else
      flash[:alert] = @app_om.errors.full_messages.join(",")
      redirect_to edit_purchase_requisition_path(@app_om)
    end
  end
  
  def no_approval_om
    @app_om = PurchaseRequisition.find(params[:id])
    params[:remark] = nil unless params[:remark].present?
    user = User.find(@app_om.requested_by)
    if @app_om.update_attributes!(:status => generate_add_status(user), :approved_by_level_two => nil, :approved_by_level_two_date => nil, :remark => params[:remark], :tasks => user.id)
      redirect_to edit_purchase_requisition_path(@app_om), :notice => "Update Successfully."
    else
      flash[:alert] = @app_om.errors.full_messages.join(",")
      redirect_to edit_purchase_requisition_path(@app_om)
    end
  end
  
  def yes_approval_three
    @app_three = PurchaseRequisition.find(params[:id])
    if @app_three.update_attributes(:status => PurchaseRequisition::SUBMIT_PO, :approved_by_level_five => current_user.id, :approved_by_level_five_date => Date.today, :tasks => 0)
      PurchaseRequisitionManagement.completed_update(@app_three)
      redirect_to edit_purchase_requisition_path(@app_three), :notice => "Update Successfully."
    else
      flash[:alert] = @app_three.errors.full_messages.join(",")
      redirect_to edit_purchase_requisition_path(@app_three)
    end
  end
  
  def no_approval_three
    @app_three = PurchaseRequisition.find(params[:id])
    params[:remark] = nil unless params[:remark].present?
    user = User.find(@app_three.requested_by)
    if @app_three.update_attributes(:status => generate_add_status(user), :approved_by_level_two => nil, :approved_by_level_two_date => nil, :approved_by_level_three => nil, :approved_by_level_three_date => nil, :remark => params[:remark], :tasks => user.id)
      redirect_to edit_purchase_requisition_path(@app_three), :notice => "Update Successfully."
    else
      flash[:alert] = @app_three.errors.full_messages.join(",")
      redirect_to edit_purchase_requisition_path(@app_three)
    end
  end
  
  def show_details_two
    @show = PurchaseRequisition.where(:approved_by_level_two => params[:approval_user_id])
    @user = User.find(params[:approval_user_id])
    render :layout => false
  end
  
  def show_details_three
    @show = PurchaseRequisition.where(:approved_by_level_three => params[:approval_user_id])
    @user = User.find(params[:approval_user_id])
    render :layout => false
  end
  
  def pr_no
    @pr_no = PurchaseRequisition.select('pr_no').uniq.select('id')
    respond_to do |format|
      format.html
      format.json { render json: @pr_no }
    end
  end
  
  def pr_status
    @pr_status = PurchaseRequisition.select('status').uniq
    respond_to do |format|
      format.html
      format.json { render json: @pr_status }
    end
  end
  
  def pr_requestor
    array = []
    @pr_requestor = PurchaseRequisition.select('requested_by').uniq
    
    @pr_requestor.each do |p|
      user = User.find(p.requested_by)
      array << {:id => user.id, :requested_by => user.name, :department => user.department.name}
    end
    
    respond_to do |format|
      format.html
      format.json { render json: array }
    end
  end
  
  def pr_department
    department = []
    @pr_requestor = PurchaseRequisition.select('requested_by').uniq
    
    @pr_requestor.each do |p|
      user = User.find(p.requested_by)
      department << {:id => user.id, :requested_by => user.name, :department => user.department.name}
    end
    
    respond_to do |format|
      format.html
      format.json { render json: department }
    end
  end
  
  private 
  
  def inventory_management_system
    role(PurchaseRequisition::ROLE)
  end
  
  def generate_add_status(user)
    PurchaseRequisition::LEVEL_ONE
  end
  
  def loading_logic(id)
    @purchase_requisition = PurchaseRequisition.find(id)
    @user                 = User.find(@purchase_requisition.requested_by)
    @logic                = PurchaseRequisition.logic(@user)
  end
  
  def loading
    @pr_status      = PurchaseRequisition.uniq_status
    @pr_requestor   = PurchaseRequisition.uniq_requestor
  end
end
