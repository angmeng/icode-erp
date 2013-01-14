class PurchaseRequisitionsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :inventory_management_system, :except => [:show]
  layout "sheetbox"

  def index
    @search = PurchaseRequisition.search(params[:search])
    @purchase_requisitions = PurchaseRequisition.ordered_pr_no(@search)
    if User.is_boss(current_user)
      @purchase_requisitions = @purchase_requisitions.all
    else
      @purchase_requisitions = @purchase_requisitions.find_all_by_requested_by(current_user.id)
    end
    @pr_status = PurchaseRequisition.uniq_status
    @pr_requestor = PurchaseRequisition.uniq_requestor
    @pr_department = PurchaseRequisition.uniq_department
  end
  
  def kiv
    @purchase_requisitions = PurchaseRequisition.ordered_pr_no_kiv
  end
  
  def show
    @purchase_requisition = PurchaseRequisition.find(params[:id])
    @user = User.find(@purchase_requisition.requested_by)
    @logic = PurchaseRequisition.logic(@user)
    @show_items = @purchase_requisition.purchase_requisition_items
  end

  def new
    @purchase_requisition = PurchaseRequisition.new
    @pending = current_user.purchase_requisition_items.where("status = ?", PurchaseRequisitionItem::PENDING)
  end

  def edit
    @purchase_requisition = PurchaseRequisition.find(params[:id])
    @user = User.find(@purchase_requisition.requested_by)
    @logic = PurchaseRequisition.logic(@user)
    @edit_items = @purchase_requisition.purchase_requisition_items
    @app_lvl2 = User.find(@purchase_requisition.approved_by_level_two) if @purchase_requisition.approved_by_level_two?
    @app_lvl3 = User.find(@purchase_requisition.approved_by_level_three) if @purchase_requisition.approved_by_level_three?
    @app_lvl4 = User.find(@purchase_requisition.approved_by_level_five) if @purchase_requisition.approved_by_level_five?
  end

  def create
    @purchase_requisition = PurchaseRequisition.new(params[:purchase_requisition])
    pr_value = company.sn_purchase_req_no.to_i + 1
    @purchase_requisition.pr_no = pr_value
    
    if current_user.direct_report == TRUE
      boss = User.find_by_level(5)
      @purchase_requisition.status = PurchaseRequisition::LEVEL_FIVE
      @purchase_requisition.tasks = boss.id
    else
      @purchase_requisition.status = PurchaseRequisition.generate_level(current_user)
      @purchase_requisition.tasks = current_user.report_to
    end
    
    if params[:select_items].present?
      @eta, msg = PurchaseRequisitionItem.before_check_eta(current_user, params[:select_items])
      if @eta.present?
        if @purchase_requisition.save
          company.update_attributes(:sn_purchase_req_no => pr_value)
          PurchaseRequisitionItem.run_update(@purchase_requisition, current_user, params[:select_items])
          redirect_to new_purchase_requisition_path, notice: 'Purchase requisition was successfully created.'
        else
          flash[:alert] = @purchase_requisition.errors.full_messages.join(", ")
          error_callback
        end
      else
        flash[:alert] = msg
        error_callback
      end
    else
      flash[:alert] = "Please select items from checkboxes."
      error_callback
    end
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
    @purchase_requisition.update_attributes(:status => PurchaseRequisition::KEEP_IN_VIEW)

    respond_to do |format|
      format.html { redirect_to purchase_requisitions_path, :notice => "The PR has dropped to KIV." }
      format.json { head :no_content }
    end
  end
  
  def recover
    @purchase_requisition = PurchaseRequisition.find(params[:id])
    user = User.find(@purchase_requisition.requested_by)
    
    if user.level == User::LEVEL_ONE
      @purchase_requisition.update_attributes(:status => PurchaseRequisition::LEVEL_ONE, :tasks => user.id)
    elsif user.level == User::LEVEL_TWO
      @purchase_requisition.update_attributes(:status => PurchaseRequisition::LEVEL_TWO, :tasks => user.id)
    elsif user.level == User::LEVEL_THREE
      @purchase_requisition.update_attributes(:status => PurchaseRequisition::LEVEL_THREE, :tasks => user.id)
    elsif user.level == User::LEVEL_FIVE
      @purchase_requisition.update_attributes(:status => PurchaseRequisition::LEVEL_FIVE, :tasks => user.id)
    else
      @purchase_requisition.update_attributes(:status => PurchaseRequisition::KEEP_IN_VIEW)
    end

    respond_to do |format|
      format.html { redirect_to kiv_purchase_requisitions_path, :notice => "The PR has recovered from KIV." }
      format.json { head :no_content }
    end
  end
  
  def signature_report
    @user_report = current_user.prs
  end
  
  def yes_approval_requester
    @app_req = PurchaseRequisition.find(params[:id])
    @app_req_user = User.find_by_id(@app_req.requested_by)
    if @app_req_user.direct_report == TRUE
      add_status = PurchaseRequisition::LEVEL_FIVE
      task = User.find_by_level(5).id
    else
      if @app_req.status == PurchaseRequisition::LEVEL_ONE
        add_status = PurchaseRequisition::LEVEL_TWO
      elsif @app_req.status == PurchaseRequisition::LEVEL_TWO
        add_status = PurchaseRequisition::LEVEL_THREE
      elsif @app_req.status == PurchaseRequisition::LEVEL_THREE
        add_status = PurchaseRequisition::LEVEL_FIVE
      end
      task = current_user.report_to
    end
    
    if @app_req.update_attributes(:status => add_status, :requested_by_date => Date.today, :tasks => task, :remark => nil)
      redirect_to edit_purchase_requisition_path(@app_req), :notice => "Update Successfully."
    else
      flash[:alert] = @app_req.errors.full_messages.join(",")
      redirect_to edit_purchase_requisition_path(@app_req)
    end
  end
  
  def yes_approval_one
    @app_one = PurchaseRequisition.find(params[:id])
    if current_user.direct_report == true
      status = PurchaseRequisition::LEVEL_FIVE
      task = User.find_by_level(5).id
    else
      status = PurchaseRequisition::LEVEL_THREE
      task = current_user.report_to
    end
#    
    if @app_one.update_attributes(:status => status, :approved_by_level_two => current_user.id, :approved_by_level_two_date => Date.today, :tasks => task)
      redirect_to edit_purchase_requisition_path(@app_one), :notice => "Update Successfully."
    else
      flash[:alert] = @app_one.errors.full_messages.join(",")
      redirect_to edit_purchase_requisition_path(@app_one)
    end
  end
  def no_approval_one
    @app_one = PurchaseRequisition.find(params[:id])
    params[:remark] = nil unless params[:remark].present?
    user = User.find(@app_one.requested_by)
    if @app_one.update_attributes(:status => generate_add_status(user), :remark => params[:remark], :tasks => user.id)
      redirect_to edit_purchase_requisition_path(@app_one), :notice => "Update Successfully."
    else
      flash[:alert] = @app_one.errors.full_messages.join(",")
      redirect_to edit_purchase_requisition_path(@app_one)
    end
  end
  
  
  def yes_approval_om
    @app_om = PurchaseRequisition.find(params[:id])
    if @app_om.update_attributes(:status => PurchaseRequisition::LEVEL_FIVE, :approved_by_level_three => current_user.id, :approved_by_level_three_date => Date.today, :tasks => current_user.report_to)
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
      PurchaseRequisitionItem.completed_update(@app_three)
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
  
  def error_callback
    @pending = current_user.purchase_requisition_items.where("status = ?", PurchaseRequisitionItem::PENDING)
    render action: "new"
  end
  
  private 
  
  def inventory_management_system
    role(PurchaseRequisition::ROLE)
  end
  
  def generate_add_status(user)
      if user.level == User::LEVEL_ONE
        PurchaseRequisition::LEVEL_ONE
      elsif user.level == User::LEVEL_TWO
        PurchaseRequisition::LEVEL_TWO
      elsif user.level == User::LEVEL_THREE
        PurchaseRequisition::LEVEL_THREE
      end
  end
end
