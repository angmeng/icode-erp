class PurchaseOrdersController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update, :printable, :display_maintenance, :show_select_vendor, :make_purchase_order, :select_vendor]
  def index
    @po_title = PurchaseOrder.title
    @search = PurchaseOrder.search(params[:search])
    @purchase_orders = PurchaseOrder.search_purchase_orders(@search)
    if user_is_admin?
      @purchase_orders = @purchase_orders.all
    else
      @purchase_orders = @purchase_orders.find_all_by_purchase_by(current_user.id)
    end
  end
  
  def kiv
    @search = PurchaseOrder.search(params[:search])
    @purchase_orders = PurchaseOrder.search_purchase_orders_kiv(@search)
  end

  def show
    @purchase_order = PurchaseOrder.find(params[:id])
  end
  
  def printable
    @purchase_order = PurchaseOrder.find(params[:id])
  end
  
  def new
    @purchase_order = PurchaseOrder.new #with ste
    callback_module(params[:company_id]) if params[:company_id].present?
  end
  
  def create
    @purchase_order = PurchaseOrder.new(params[:purchase_order])
    if @purchase_order.save
      company.update_attributes(:sn_purchase_order_no => @purchase_order.po_no)
      PurchaseOrderManagement.overwrite_eta(params[:datarow]) if params[:datarow].present?
      PurchaseOrderManagement.pri_status_with_ste(@purchase_order.trade_company_id, @purchase_order.id)
      redirect_to @purchase_order, notice: 'Purchase order was successfully created.'
    else
      callback_module(@purchase_order.trade_company_id) if @purchase_order.trade_company_id.present?
      flash[:alert] = @purchase_order.errors.full_messages.join(", ")
      render action: "new"
    end
  end
  
  def create_without_sales_tax_exemption
    @purchase_order = PurchaseOrder.new(params[:purchase_order])
    callback_module(@purchase_order.trade_company_id) if @purchase_order.trade_company_id.present?
    if @purchase_order.save
      company.update_attributes(:sn_purchase_order_no => @purchase_order.po_no)
      PurchaseOrderManagement.overwrite_eta(params[:datarow]) if params[:datarow].present?
      PurchaseOrderManagement.pr_items_status(@purchase_order.trade_company_id, @purchase_order.id)
      redirect_to @purchase_order, notice: 'Purchase order was successfully created.'
    else
      flash[:alert] = @purchase_order.errors.full_messages.join(", ")
      render "new"
    end
  end
  
  def edit
    @purchase_order = PurchaseOrder.find(params[:id])
    if @purchase_order.trade_company_id.present?
      callback_module(@purchase_order.trade_company_id) 
      @pri_company = @purchase_order.purchase_requisition_items
    end
  end

  def update
    @purchase_order = PurchaseOrder.find(params[:id])

    respond_to do |format|
      if @purchase_order.update_attributes(params[:purchase_order])
        format.html { redirect_to @purchase_order, notice: 'Purchase order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @purchase_order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @purchase_order = PurchaseOrder.find(params[:id])
    @purchase_order.update_attributes(:status => PurchaseOrder::KEEP_IN_VIEW)

    respond_to do |format|
      format.html { redirect_to purchase_orders_url, :notice => "P/O No # #{@purchase_order.po_no} has dropped to KIV." }
      format.json { head :no_content }
    end
  end
  
  def recover
    @purchase_order = PurchaseOrder.find(params[:id])
    @purchase_order.update_attributes(:status => PurchaseOrder::ACTIVE)

    respond_to do |format|
      format.html { redirect_to kiv_purchase_orders_url, :notice => "P/O No # #{@purchase_order.po_no} has recovered from KIV." }
      format.json { head :no_content }
    end
  end
  
  



  
#  =========================== Other ==================================================
  
  def cancel
    @pr  = PurchaseRequisition.find(params[:pr_id])
    if params[:company_name].present?
      @pri = @pr.purchase_requisition_items.where(:trade_company_new_name => params[:company_name])
      @pri.each {|cn| cn.update_attributes!(:status => PurchaseRequisitionItem::CANCEL)}
    else
      @pri = @pr.purchase_requisition_items.where(:trade_company_id => params[:company_id])
      @pri.each {|cn| cn.update_attributes!(:status => PurchaseRequisitionItem::CANCEL)}
    end
    redirect_to purchase_orders_path, :notice => "The PR has cancelled successfully."
  end
  
#  def recover
#    @pr  = PurchaseRequisition.find(params[:pr_id])
#    if params[:company_name].present?
#      @pri = @pr.purchase_requisition_items.where(:trade_company_new_name => params[:company_name])
#      @pri.each {|cn| cn.update_attributes!(:status => PurchaseRequisitionItem::APPROVED)}
#    else
#      @pri = @pr.purchase_requisition_items.where(:trade_company_id => params[:company_id])
#      @pri.each {|cn| cn.update_attributes!(:status => PurchaseRequisitionItem::APPROVED)}
#    end
#    redirect_to purchase_orders_path, :notice => "The PR has cancelled successfully."
#  end
  
#  =========================== Approved From Purchase Requisition ===========================
  def approved_pr
    @option_product_id = PurchaseRequisitionItem.collect_pid
    if params[:item_status].present? or params[:pr_no].present? or params[:product_id].present?
      @approved_pr = PurchaseRequisitionItem.search_item_status(params[:item_status]) if params[:item_status].present?
      @approved_pr = PurchaseRequisitionItem.search_pr_no(params[:pr_no])             if params[:pr_no].present?
      @approved_pr = PurchaseRequisitionItem.search_product_id(params[:product_id])   if params[:product_id].present?
    else
      @approved_pr = PurchaseRequisitionItem.ordered_purchase_requisition_id
    end
  end
#  =========================== Approved From Purchase Requisition (End) ===========================
  
#  =========================== Maintenance ==================================================
  def maintenance
    @maintenance = PurchaseRequisitionItem.where("status = ? and maintenance = ?", PurchaseRequisitionItem::APPROVED, PurchaseRequisitionItem::MAINTENANCE)
  end
  
  # Popup Maintenance
  def display_maintenance
    @pr_item = PurchaseRequisitionItem.find(params[:id])
  end
  
  # when click apply
  def add_vendor
    maintenance
    if params[:select_items].present?
      if params[:datarow].present?
        PurchaseOrderManagement.goto_create_new_sources(params[:select_items], params[:datarow])
        redirect_to maintenance_purchase_orders_path, :notice => "Submit to Vendor Selection Successfully."
      else
        flash[:alert] = "Please key-in Proposed Vendor and Unit Price."
        render "maintenance"
      end      
    else
      flash[:alert] = "Please select the checkboxes."
      render "maintenance"
    end
  end
  
  #Submit Vendor Selection, no useful on 20/4/2013
  def submit_vselect    
    @pr_item = PurchaseRequisitionItem.find(params[:id])
    if @pr_item.update_attributes(:maintenance => 0, :proposed_vendor => 1)
      redirect_to maintenance_purchase_orders_path, :notice => "Submit to Vendor Selection successfully."
    else
      flash[:alert] = @pr_item.errors.full_messages.join(", ")
      redirect_to maintenance_purchase_orders_path #      render "maintenance"
    end
  end
#  =========================== Maintenance (End) ============================================
  
#  ====================== PROPOSED VENDOR ============================
  def proposed_vendor
    @proposed_vendor = PurchaseRequisitionItem.where("status = ? and proposed_vendor = ? and maintenance = ?", PurchaseRequisitionItem::APPROVED, FALSE, FALSE)
  end
  
  def select_vendor   #PROPOSED VENDOR - APPLY
    @purchase_requisition_item = PurchaseRequisitionItem.find(params[:id])
  end
  
  def change_vendor
    @pri = PurchaseRequisitionItem.find(params[:id])
    PurchaseOrder.update_option(@pri, params[:vendor_radio])
    PurchaseOrder.update_company(@pri, params[:vendor_name])
    PurchaseOrder.update_price(@pri, params[:price])
    PurchaseOrder.update_remark(@pri, params[:remark])
    redirect_to select_vendor_purchase_orders_path(:id => @pri.id), :notice => "Changed vendor Successfully."
  end
  
  def proposed_approval # click submit
    @pri = PurchaseRequisitionItem.find(params[:id])
    if @pri.update_attributes(:proposed_vendor => TRUE)
      redirect_to proposed_vendor_purchase_orders_path, :notice => "Submit to Vendor Selection successfully."
    else
      flash[:alert] = @pri.errors.full_messages.join(", ")
      redirect_to proposed_vendor_purchase_orders_path
    end
  end
#  ====================== PROPOSED VENDOR (END) ============================

#  ====================== VENDOR SELECTION ============================  
  def pending_approval # Vendor Selection
    prohibit_html unless roles.include?(InventoryManagementSystem::PURCHASE_ORDER_VENDOR_SELECTION)
    @pending_vendor = PurchaseRequisitionItem.where("status = ? and proposed_vendor = ? and approval_proposed = ?", PurchaseRequisitionItem::APPROVED, true, false)
  end
  
  def show_select_vendor
    @purchase_requisition_item = PurchaseRequisitionItem.find(params[:id])
  end
  
  def approval_yes
    @pri = PurchaseRequisitionItem.find(params[:id])
    if @pri.update_attributes!(:approval_proposed => TRUE)
      redirect_to show_select_vendor_purchase_order_path(@pri), :notice => "You have Approved. This form was sent to Vendor Registration or PO Entry."
    else
      flash[:alert] = @pri.errors.full_messages.join(", ")
      redirect_to show_select_vendor_purchase_order_path(@pri)
    end
  end
  
  def approval_no
    @pri = PurchaseRequisitionItem.find(params[:id])
    if params[:approval_remark].present?
      if @pri.temporary_sources.size == 1
        @pri.update_attributes(:proposed_vendor => FALSE, :approval_remark => params[:approval_remark], :maintenance => TRUE)
        redirect_to show_select_vendor_purchase_order_path(@pri), :notice => "NOT Approved. This form was sent back to PR-Repair."
      else
        @pri.update_attributes(:proposed_vendor => FALSE, :approval_remark => params[:approval_remark])
        redirect_to show_select_vendor_purchase_order_path(@pri), :notice => "NOT Approved. This form was sent back to Proposed Vendor."
      end
    else
      flash[:alert] = "Remark can't blank."
      redirect_to show_select_vendor_purchase_order_path(@pri)
    end
  end
#  ====================== VENDOR SELECTION (END) =======================
    
#  ====================== VENDOR REGISTRATION ============================ 
  def vendor
    prohibit_html unless roles.include?(InventoryManagementSystem::PURCHASE_ORDER_VENDOR_REGISTRATION)
    filter_matching_vendor
  end
#  ====================== VENDOR REGISTRATION (END) ============================ 
  
#  ====================== PRODUCT ID Registration (non operation and Operation) ============================ 
  def no_product_id
    prohibit_html unless roles.include?(InventoryManagementSystem::PURCHASE_ORDER_PRODUCT_ID_REGISTRATION)
    @no_product_id = PurchaseRequisitionItem.where(:status => PurchaseRequisitionItem::APPROVED)
                                            .reject { |attr_a| attr_a['trade_company_id'].blank? }
                                            .select { |attr_b| attr_b['product_id'].blank? }
  end
#  ====================== PRODUCT ID Registration (non operation and Operation) (end) ============================ 
  
#finally
  def make_purchase_order
    filter_matching_vendor
    @pr_items = PurchaseRequisitionItem.where(:status => PurchaseRequisitionItem::APPROVED).group_by(&:trade_company_id)
  end
  
  private
  
  def filter_matching_vendor
    @vendor = PurchaseRequisitionItem.where("status = ? and proposed_vendor = ? and approval_proposed = ?", PurchaseRequisitionItem::APPROVED, true, true)
    PurchaseOrderManagement.generator_match_vendor(@vendor, trade_company_vendor)
  end
  
#  def expired_date
#    if ste_no_with_valid.present?
#      ste_no_with_valid.each do |ste|
#        if ste.period_start <= Date.today and Date.today < ste.period_end
#
#        else
#          ste.update_attributes(:valid_condition => FALSE)
#        end
#      end
#    end
#  end
  
  def callback_module(trade_company_id)
    @pri_company = PurchaseRequisitionItem.grouping_companies(trade_company_id)
    @vendor_id = TradeCompany.find(trade_company_id)
    
#    @ste = ste_no_with_valid.find_by_trade_company_id(trade_company_id) # for single and if valid_condition is TRUE
#    @exist_sales_tax = ste_no_with_not_valid.find_all_by_trade_company_id(trade_company_id) # if need to renew STE
  end

  # def inventory_management_system
  #   role(PurchaseOrder::ROLE)
  # end
end
