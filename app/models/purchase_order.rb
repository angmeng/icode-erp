class PurchaseOrder < ActiveRecord::Base
  attr_accessible :currency_id, :po_date, :po_no, :purchase_by, :request_by, :revision, :tax, :trade_company_id, :trade_term_id, :transport_id, :updated_by, :user_id, :verify, :purchase_requisition_id, :sales_tax_exemption_id, :status, :remark
  
  validates :revision, :tax, :currency_id, :trade_term_id, :transport_id, :presence => true
  
  belongs_to :trade_company
  belongs_to :currency
  belongs_to :trade_term
  belongs_to :transport
  belongs_to :user
  belongs_to :purchase_requisition
  belongs_to :sales_tax_exemption
  
  has_many   :purchase_order_item_lines, :dependent => :destroy
  has_many   :purchase_requisition_items, :through => :purchase_order_item_lines
  has_many   :sales_tax_exemption_item
  
  YES = 1
  NO = 2
  ACTIVE = "ACTIVE"
  KEEP_IN_VIEW = "KIV"
  STOPPED = "stop"
  OVERWEIGHT = "overweight"
  MISSING = "missing"
  
#   ROLE = [
#     InventoryManagementSystem::PURCHASE_ORDER_MENU,  
#     InventoryManagementSystem::PURCHASE_ORDER_APPROVED_FROM_PR,   
#     InventoryManagementSystem::PURCHASE_ORDER_APPROVED_FROM_PR_SHOW, 
#     InventoryManagementSystem::PURCHASE_ORDER_PR_REPAIR,                    
#     InventoryManagementSystem::PURCHASE_ORDER_PROPOSED_VENDOR,              
#     InventoryManagementSystem::PURCHASE_ORDER_VENDOR_SELECTION,             
#     InventoryManagementSystem::PURCHASE_ORDER_VENDOR_REGISTRATION,          
#     InventoryManagementSystem::PURCHASE_ORDER_ENTRY,                        
#     InventoryManagementSystem::PURCHASE_ORDER_TRANSACTION,                  
#     InventoryManagementSystem::PURCHASE_ORDER_KIV_VIEW, 
#     InventoryManagementSystem::PURCHASE_ORDER_PR_REPAIR_APPLY,              
#     InventoryManagementSystem::PURCHASE_ORDER_PR_REPAIR_SUBMIT_TO,          
#     InventoryManagementSystem::PURCHASE_ORDER_PR_REPAIR_KIV,  
#     InventoryManagementSystem::PURCHASE_ORDER_PROPOSED_VENDOR_APPLY,        
#     InventoryManagementSystem::PURCHASE_ORDER_PROPOSED_VENDOR_SUBMIT_TO,    
#     InventoryManagementSystem::PURCHASE_ORDER_PROPOSED_VENDOR_KIV, 
#     InventoryManagementSystem::PURCHASE_ORDER_VENDOR_SELECTION_APPLY,       
# #    InventoryManagementSystem::PURCHASE_ORDER_VENDOR_SELECTION_SUBMIT_TO,   
#     InventoryManagementSystem::PURCHASE_ORDER_VENDOR_SELECTION_KIV,   
#     InventoryManagementSystem::PURCHASE_ORDER_VENDOR_REGISTRATION_APPLY, 
# #    InventoryManagementSystem::PURCHASE_ORDER_VENDOR_REGISTRATION_SUBMIT_TO,
#     InventoryManagementSystem::PURCHASE_ORDER_VENDOR_REGISTRATION_KIV,
#     InventoryManagementSystem::PURCHASE_ORDER_ENTRY_APPLY,          
# #    InventoryManagementSystem::PURCHASE_ORDER_ENTRY_SUBMIT_TO,      
#     InventoryManagementSystem::PURCHASE_ORDER_ENTRY_KIV,      
#     InventoryManagementSystem::PURCHASE_ORDER_TRANSACTION_SHOW,     
#     InventoryManagementSystem::PURCHASE_ORDER_TRANSACTION_EDIT,     
#     InventoryManagementSystem::PURCHASE_ORDER_TRANSACTION_KIV,      
#     InventoryManagementSystem::PURCHASE_ORDER_TRANSACTION_PRINTABLE,
#     InventoryManagementSystem::PO_KIV_SHOW,  
#     InventoryManagementSystem::PO_KIV_RECOVER
#   ]
  
  default_scope order("po_no DESC")
  
#  def self.ordered(search)
#    search.where(:status => PurchaseOrder::ACTIVE)
#  end

  def self.search_purchase_orders(search)
    search.where(:status => PurchaseOrder::ACTIVE)
  end
  
  def self.search_purchase_orders_kiv(search)
    search.where(:status => PurchaseOrder::KEEP_IN_VIEW)
  end
  
  def self.gather_ste(pr_id)
    Custom.where(:trade_company_id => pr_id.trade_company.id)
  end
  
  def self.find_company_id(vendor_id)
    find_all_by_trade_company_id(vendor_id)
  end
  
  def self.update_option(pri, vendor_radio)
    if pri.present?
      pri.temporary_sources.each do |tv|
        if tv.id.to_i == vendor_radio.to_i
          tv.update_attributes(:select_vendor => TRUE)
        else
          tv.update_attributes(:select_vendor => FALSE)
        end
      end
    end
  end
  
  def self.update_company(pri, vendor_name)
    if pri.temporary_sources.present?
      vendor_name.each do |temp_source, content|
        ts = pri.temporary_sources.find_by_id(temp_source)
        if content[:data].present?
          ts.company_name = content[:data]
        else
          ts.company_name = "-"
        end
        ts.save
      end
    end
  end
  
  def self.update_price(pri, price)
    if pri.temporary_sources.present?
      price.each do |temp_source, content|
        ts = pri.temporary_sources.find_by_id(temp_source)
        if content[:data].present?
          ts.unit_price = content[:data]
        else
          ts.unit_price = 0.0000
        end
        ts.save
      end
    end
  end
  
  def self.update_remark(pri, remark)
    if pri.temporary_sources.present?
      remark.each do |temp_source, content|
        ts = pri.temporary_sources.find_by_id(temp_source)
        if content[:data].present?
          ts.remark = content[:data]
        else
          ts.remark = ' '
        end
        ts.save
      end
    end
  end
  
#  # if vendor name must matching common vendor name, will overwrite them...
#  def self.generator_match_vendor(vendor, tc_vendor)
#    if vendor.present?
#      vendor.each do |v|
#        if v.temporary_sources.present?
#          if v.temporary_sources.find_by_select_vendor(TRUE).present?
#            vv = v.temporary_sources.find_by_select_vendor(TRUE)
#            tc = tc_vendor.find_by_name(vv.company_name)
#            v.update_attributes(:trade_company_id => tc.id, :unit_price => vv.unit_price) if tc.present?
#          end
#        end
#      end
#    end
#  end
  
  def self.chk_weight(kgs)
    if kgs.present?
      # to store temporary tarif code
      kgs.each do |pri_id, content|
        pri = PurchaseRequisitionItem.find(pri_id)
        
        ste_tarif_code = SalesTaxExemption.trade_company_id_and_valid_condition(pri.trade_company_id, TRUE)
        if ste_tarif_code.present?
          if ttc = TemporaryTarifCode.find_by_tarif_code(ste_tarif_code.tarif_code)
            ttc.update_attributes!(:remaining_total => ste_tarif_code.remaining_total)
          else
            TemporaryTarifCode.create(:tarif_code => ste_tarif_code.tarif_code, :remaining_total => ste_tarif_code.remaining_total)
          end
        end
      end
      
      kgs.each do |pri_id, content|
        pri = PurchaseRequisitionItem.find(pri_id)  
        ste_tarif_code = SalesTaxExemption.trade_company_id_and_valid_condition(pri.trade_company_id, TRUE)
#        ttc = TemporaryTarifCode.find_by_tarif_code(ste_tarif_code.tarif_code)
        
        remaining = ttc.remaining_total - content[:qty].to_f
        ttc.remaining_total = remaining
          if content[:qty].to_f > 0
            if ste_tarif_code.apply_qty >= remaining and remaining >= 0
              ttc.save!
            else
              return false, "Remaining total has over weight."
              break
            end
          else
            return false, "Your entry weight has ZERO."
            break
          end
      end
    end
  end
  
  PO_WITH_PR_NO = 1
  PO_NO = 2
  PO_DATE = 3
  PO_VENDOR = 4
  PURCHASED_BY = 5
  REQUESTED_BY = 6
  
  def self.title
    arr_title = []
    arr_title << ["PR No.", PurchaseOrder::PO_WITH_PR_NO]
    arr_title << ["PO No.", PurchaseOrder::PO_NO]
    arr_title << ["PO Date", PurchaseOrder::PO_DATE]
    arr_title << ["Vendor", PurchaseOrder::PO_VENDOR]
    arr_title << ["Purchased By", PurchaseOrder::PURCHASED_BY]
    arr_title << ["Purchased By", PurchaseOrder::REQUESTED_BY]
    return arr_title
  end
  
  def self.search_engine(title_box, select_title)
    if select_title.to_i == PurchaseOrder::PO_NO
      pr = PurchaseRequisition.find_by_pr_no(title_box.to_i)
      return where(:purchase_requisition_id => pr)
    end
  end
  
  def self.all_vendor_code
    select(:trade_company_id).uniq.map { |c| [ c.trade_company.code, c.trade_company.id ] }
  end
  
  def self.all_vendor_name
    select(:trade_company_id).uniq.map { |c| [ c.trade_company.name, c.trade_company.id ] }
  end
  
  
#  def self.select_check(vendor_id)
#    po_checked = []
#    @po = self.where(:trade_company_id => vendor_id)
#    @po.each do |po|
#      po.purchase_order_item_lines.where(:checked => TRUE).each do |checked|
#        po_checked << checked.id
#      end
#    end
#    return po_checked
#  end
  
#    def self.search_engine(field_box, select_field)
#    if select_field.to_i == PurchaseRequisition::PR_NO
#      return where(:id => field_box)
#    elsif select_field.to_i == PurchaseRequisition::PR_STATUS
#      return where(:status => field_box)
#    elsif select_field.to_i == PurchaseRequisition::REQUESTOR
#      return where(:requested_by => field_box)
#    elsif select_field.to_i == PurchaseRequisition::DEPARTMENT
#      return where(:requested_by => field_box)
#    else
#      
#    end
#  end
end
