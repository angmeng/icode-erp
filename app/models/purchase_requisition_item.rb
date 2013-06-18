class PurchaseRequisitionItem < ActiveRecord::Base
  before_save   :uppercase_text
  before_update :uppercase_text
  
  attr_accessible :description, :eta, :product_id, :purchase_order_no, :purchase_requisition_id, :quantity, :remark, 
                  :trade_company_id, :unit_measurement_id, :unit_price, :status, :trade_company_new_name, :user_id, :maintenance,
                  :proposed_vendor, :temporary_sources_attributes, :approval_proposed, :approval_remark, :urgent, :skip_to_purchase_order
                
  validates :description, :length => { :maximum => 255 }
  validates :eta, :unit_measurement_id, :presence => true
  
  belongs_to :product
  belongs_to :trade_company
  belongs_to :unit_measurement
  belongs_to :user
  belongs_to :purchase_requisition
  
  has_one    :receive_note
  has_one    :incoming_reject
  
  has_one    :purchase_order_item_line, :dependent => :destroy
  has_many   :purchase_orders, :through => :purchase_order_item_lines
  has_many   :temporary_sources, :dependent => :destroy
  accepts_nested_attributes_for :temporary_sources, :allow_destroy => true
  
  MAINTENANCE = TRUE
  
  # It is Items Status
  PENDING       = 'P'
  APPROVED      = 'A'
  IN_PROCESSING = 'IP'
  REJECT        = 'R'
  PURCHASE_ORDER  = "PO"   # Pending PO
  RECEIVE_NOTE     = "RN"  # PO issued
  RECEIVED_PARTIAL = "RP"
  RECEIVED_FULL    = "RF"
  KEEP_IN_VIEW    = "KIV"
  INCOMING_REJECT = "IR"
  CANCEL          = "X"
  
  
  #approved_pr in purchase order
  scope :ordered_purchase_requisition_id, order("purchase_requisition_id DESC").where("status = ?", PurchaseRequisitionItem::APPROVED)  
  
#  def self.run_update(purchase_requisition, user, select_items)
#    user_pending = user.purchase_requisition_items.where(:status => PurchaseRequisitionItem::PENDING).find(select_items)
#    if user_pending.present?
#      user_pending.each do |p|
#        if user.level == User::LEVEL_FIVE
#          p.update_attributes(:purchase_requisition_id => purchase_requisition.id, :status => PurchaseRequisitionItem::APPROVED)
#        else
#          p.update_attributes(:purchase_requisition_id => purchase_requisition.id, :status => PurchaseRequisitionItem::IN_PROCESSING)
#        end
#      end
#    end
#  end
  
#  def self.before_check_eta(user, select_items)
#    user_pending = user.purchase_requisition_items.where(:status => PurchaseRequisitionItem::PENDING).find(select_items)
#    if user_pending.present?
#      user_pending.each do |p|
#        if p.eta < Date.today
#          return false, "ETA should have future date."
#        else
#          return true
#        end
#      end
#    end
#  end

  def is_skip_to_po?
    skip_to_purchase_order == TRUE
  end
  
  def urgent?
    urgent == TRUE
  end
  
#  def self.completed_update(app_three)
#    all_pending = app_three.purchase_requisition_items.where(:status => PurchaseRequisitionItem::IN_PROCESSING)
#    if all_pending.present?
#      all_pending.each do |p|
#        if p.is_skip_to_po?
#          p.update_attributes(:status => PurchaseRequisitionItem::APPROVED)
#        else
#          p.update_attributes(:status => PurchaseRequisitionItem::APPROVED)
#        end
#      end
#    end
#  end
          
#  def self.pr_items_status(company_id, po_id)
#    @pri = self.where("status = ? and trade_company_id = ?", PurchaseRequisitionItem::APPROVED, company_id)
#    if @pri.present?
#      @pri.each do |pri|
#        PurchaseOrderItemLine.create(:purchase_requisition_item_id => pri.id, :purchase_order_id => po_id)
#        pri.update_attributes(:status => PurchaseRequisitionItem::RECEIVE_NOTE)
#        pri.purchase_requisition.update_attributes(:status => PurchaseRequisition::SUBMIT_RN)
#      end
#    end
#  end
  
#  def self.pri_status_with_ste(company_id, po_id, kgs)
#    @pri = self.where("status = ? and trade_company_id = ?", PurchaseRequisitionItem::APPROVED, company_id)
#    
#    if @pri.present?
#      @pri.each do |pri|
#        kgs.each do |pri_id, content|
#          if pri.id == pri_id.to_i
#            ste_tarif_code = SalesTaxExemption.find_by_id_and_trade_company_id_and_valid_condition(pri.product.sales_tax_exemption_id, pri.trade_company_id, TRUE)
#            if ste_tarif_code.present?
#              
#              remaining = ste_tarif_code.remaining_total - content[:qty].to_f
#              PurchaseOrderItemLine.create!(:purchase_requisition_item_id => pri.id, :purchase_order_id => po_id, :weight => content[:qty].to_f)
#              stei = SalesTaxExemptionItem.create!(:sales_tax_exemption_id => ste_tarif_code.id, :product_id => pri.product_id, :remaining_total => remaining, :kgs => content[:qty].to_f, :purchase_order_id => po_id)
##              ste_tarif_code.update_attributes(:remaining_total => remaining)
#              stei.sales_tax_exemption.update_attributes!(:valid_condition => FALSE) if stei.remaining_total == 0
#              
#            else
#              PurchaseOrderItemLine.create!(:purchase_requisition_item_id => pri.id, :purchase_order_id => po_id)
#            end
#          end
#        end
#        pri.update_attributes(:status => PurchaseRequisitionItem::RECEIVE_NOTE)
#        pri.purchase_requisition.update_attributes(:status => PurchaseRequisition::SUBMIT_RN)
#      end
#    end
#  end
  
  def uppercase_text
    self.description.upcase!
    self.trade_company_new_name.upcase! if self.trade_company_new_name.present?
  end
  
  def self.find_key(k)
    where("status = ?", PurchaseRequisitionItem::APPROVED).find_all_by_trade_company_id(k)
  end
  
  def self.find_pr(k, company)
    where("status = ?", PurchaseRequisitionItem::APPROVED).find_all_by_purchase_requisition_id_and_trade_company_id(k, company)
  end
  
  def find_unit_price(product, company_name)
    company_id = TradeCompany.find_by_name(company_name)
    ProductVendor.find_by_product_id_and_trade_company_id(product, company_id.id)
  end
  
  def self.grouping_companies(company_id)
    where(:status => PurchaseRequisitionItem::APPROVED, :trade_company_id => company_id.to_i)
  end
  
  def self.present_date(eta)
    if eta.present?
      if eta < Date.today
        return false, "ETA should be future date."
      else 
        return true
      end
    else
      return false, "ETA should not blank."
    end
  end
  
  

#  def self.running_new_temporary(purchase_requisition_item, company_name, estimated_price)
#    if purchase_requisition_item.product_id.present?
#      prod = Product.find(purchase_requisition_item.product_id)
#      purchase_requisition_item.description = prod.desc
#      purchase_requisition_item.unit_measurement_id = prod.unit_measurement_id
#    end    
#    purchase_requisition_item.temporary_sources.new(:company_name => company_name, :select_vendor => TRUE, :unit_price => estimated_price)
#    purchase_requisition_item.temporary_sources.new(:company_name => "-", :select_vendor => FALSE, :unit_price => 0)
#    purchase_requisition_item.temporary_sources.new(:company_name => "-", :select_vendor => FALSE, :unit_price => 0)
#  end
  
  def self.running_approval(pri)
    if pri.present?
      pri.temporary_sources.each do |i|
        if i.select_vendor == TRUE
          i.purchase_requisition_item.update_attributes!(:approval_proposed => TRUE)
        end
      end
    end
  end
  
  def self.remove_pr_module(pri)
    if pri.purchase_requisition.purchase_requisition_items.count == 1
      pri.purchase_requisition.update_attributes!(:status => PurchaseRequisition::KEEP_IN_VIEW)
    else
      pri.purchase_requisition.update_attributes!(:status => PurchaseRequisition::LEVEL_ONE)
    end
    pri.update_attributes!(:purchase_requisition_id => nil, :status => PurchaseRequisitionItem::PENDING)
  end
  
  def self.search_item_status(item_status)
    if item_status == "PR-Repair"
      app = self.where("maintenance = ? and proposed_vendor = ? and approval_proposed = ? and status = ?", TRUE, FALSE, FALSE, PurchaseRequisitionItem::APPROVED)
    elsif item_status == "Proposed Vendor"
      app = self.where("maintenance = ? and proposed_vendor = ? and approval_proposed = ? and status = ?", FALSE, FALSE, FALSE, PurchaseRequisitionItem::APPROVED)
    elsif item_status == "Vendor Selection"
      app = self.where("maintenance = ? and proposed_vendor = ? and approval_proposed = ? and status = ?", FALSE, TRUE, FALSE, PurchaseRequisitionItem::APPROVED)
    elsif item_status == "After Vendor Selection"
      app = self.where("maintenance = ? and proposed_vendor = ? and approval_proposed = ? and status = ?", FALSE, TRUE, TRUE, PurchaseRequisitionItem::APPROVED)
    else
      app = FALSE
    end
    return app
  end
  
  def self.search_pr_no(pr_no)
    app = PurchaseRequisition.find_by_pr_no_and_status(pr_no, PurchaseRequisitionItem::APPROVED)
    if app.present?
      app = app.purchase_requisition_items
    else
      app = FALSE
    end
    return app
  end
  
  def self.collect_pid
    array = []
    pid = self.where("status = ? and product_id != ?", PurchaseRequisitionItem::APPROVED, 'NULL').select('product_id').uniq("product_id")
    if pid.present?
      pid.each do |id|
        array << [id.product.code, id.product_id]
      end
    end
    return array
  end

  def self.search_product_id(pid)
    app = self.find_all_by_product_id_and_status(pid, PurchaseRequisitionItem::APPROVED)
    app = FALSE unless app.present?
    return app
  end
  
  def self.collect_vendor
    array = []
    vendor = self.where("status = ?", PurchaseRequisitionItem::APPROVED)
    if vendor.present?
      vendor.each do |vn|
        array << [vn.temporary_sources.find_by_select_vendor(1).company_name, vn.temporary_sources.find_by_select_vendor(1).purchase_requisition_item_id]
      end
    end
    return array
  end
end
    
