class PurchaseRequisitionItemsController < ApplicationController
  before_filter :authenticate_user!
  layout "sheetbox"

  def index
    @search = PurchaseRequisitionItem.search(params[:search])
    @purchase_requisition_items = @search
  end

  def show
    @purchase_requisition_item = PurchaseRequisitionItem.find(params[:id])
    @select_vendor = @purchase_requisition_item.temporary_sources.find_by_select_vendor(TRUE) if @purchase_requisition_item.temporary_sources.present?
#    @find_unit_price = @purchase_requisition_item.find_unit_price(@purchase_requisition_item.product_id, @purchase_requisition_item.temporary_sources.first.company_name) if @purchase_requisiiton_item.temporary_sources.present?

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @purchase_requisition_item }
    end
  end

  def new
    @purchase_requisition_item = PurchaseRequisitionItem.new
    @new_product = params[:new_product].to_i
  end

  def create
    @purchase_requisition_item = PurchaseRequisitionItem.new(params[:purchase_requisition_item])
    @eta, msg = PurchaseRequisitionItem.present_date(@purchase_requisition_item.eta)
    if @eta.present?
      unless @purchase_requisition_item.maintenance == PurchaseRequisitionItem::MAINTENANCE
#        PurchaseRequisitionItem.running_new_temporary(@purchase_requisition_item, params[:company_name], params[:estimated_price])
        PurchaseRequisitionManagement.running_new_temporary(@purchase_requisition_item, params[:company_name], params[:estimated_price])
      end
      if @purchase_requisition_item.save
        redirect_to @purchase_requisition_item, notice: 'Purchase Requisition Item was successfully created.'
      else
        flash[:alert] = @purchase_requisition_item.errors.full_messages.join(",")
        error_functions
      end
    else
      flash[:alert] = msg
      error_functions
    end
  end
  
  def edit
    @purchase_requisition_item = PurchaseRequisitionItem.find(params[:id])
    if @purchase_requisition_item.temporary_sources.present? 
     if @purchase_requisition_item.temporary_sources.find_by_select_vendor(TRUE).present? 
       company_name = @purchase_requisition_item.temporary_sources.find_by_select_vendor(TRUE).company_name
     end 
    end 
    
    product_value = Product.find(@purchase_requisition_item.product_id) if @purchase_requisition_item.product_id.present?
    if product_value.present?
      @aa = Product.running_option(product_value, company_name)
    else
      @all_companies = TradeCompany.order("name").all.collect {|c| [c.name, c.name] }
    end
  end

  def update
    @purchase_requisition_item = PurchaseRequisitionItem.find(params[:id])
    @eta, msg = PurchaseRequisitionItem.present_date(params[:purchase_requisition_item][:eta].to_date)
    if @eta.present?
      select_vendor = @purchase_requisition_item.temporary_sources.find_by_select_vendor(TRUE) if @purchase_requisition_item.temporary_sources.present?

      if @purchase_requisition_item.update_attributes(params[:purchase_requisition_item])
        unless @purchase_requisition_item.maintenance == TRUE
          if select_vendor.update_attributes(:company_name => params[:company_name], :unit_price => params[:estimated_price])
            redirect_to @purchase_requisition_item, notice: 'Purchase requisition item was successfully updated.'
          else
            render "edit"
          end
        else
          redirect_to @purchase_requisition_item, notice: 'Purchase requisition item was successfully updated.'
        end
      else
        flash[:alert] = @purchase_requisition_item.errors.full_messages.join(", ")
        render "edit"
      end
    else
      flash[:alert] = msg
      render "edit"
    end
  end

  def destroy
    @purchase_requisition_item = PurchaseRequisitionItem.find(params[:id])
    @purchase_requisition_item.update_attributes(:status => PurchaseRequisitionItem::KEEP_IN_VIEW)
    redirect_to new_purchase_requisition_path, :notice => "The PR item has dropped to KIV."
  end
  
  def recover
    @purchase_requisition_item = PurchaseRequisitionItem.find(params[:id])
    @purchase_requisition_item.update_attributes(:status => PurchaseRequisitionItem::PENDING)
    redirect_to kiv_purchase_requisition_items_path, :notice => "The PR item has recovered from KIV."
  end
  
  def remove_pr
    @purchase_requisition_item = PurchaseRequisitionItem.find(params[:id])
    pr_id = @purchase_requisition_item.purchase_requisition.try(:id)
    pr_no = @purchase_requisition_item.purchase_requisition.try(:pr_no)
    counting = @purchase_requisition_item.purchase_requisition.purchase_requisition_items.count
    PurchaseRequisitionItem.remove_pr_module(@purchase_requisition_item)
    if counting == 1
      redirect_to new_purchase_requisition_path, :notice => "The PR item has removed successfully."
    else
      redirect_to edit_purchase_requisition_path(pr_id), :notice => "The PR item has removed successfully."
    end
  end
  
  def error_functions
    unless @purchase_requisition_item.product_id.present?
      @new_product = PurchaseRequisition::YES
    end
    render action: "new"
  end
  
  def kiv
    @purchase_requisition_items = PurchaseRequisitionItem.where(:status => PurchaseRequisitionItem::KEEP_IN_VIEW)
  end
end
