class ReceiveNote < ActiveRecord::Base
  before_save   :uppercase_text
  before_update :uppercase_text
  
  attr_accessible :receive_note_no, :vendor_delivery_no, :updated_by, :licence_no, :trade_company_id, :sales_tax_exemption_id, :rn_date

  has_many :receive_note_items, :dependent => :destroy
  has_one  :purchase_order_item_line
  
  belongs_to :purchase_requisition_item
  belongs_to :trade_company
  
  ACTIVE = "ACTIVE"
  KEEP_IN_VIEW = "KIV"
  
  ROLE = [
    InventoryManagementSystem::RECEIVE_NOTE_MENU,
    InventoryManagementSystem::RECEIVE_NOTE_NEW,
    InventoryManagementSystem::RECEIVE_NOTE_TRANSACTION,
    InventoryManagementSystem::RECEIVE_NOTE_COMPLETED_VIEW,
    InventoryManagementSystem::RECEIVE_NOTE_KIV_VIEW,
    InventoryManagementSystem::RECEIVE_NOTE_NEW_ADD,
    InventoryManagementSystem::RECEIVE_NOTE_TRANSACTION_SHOW,
    InventoryManagementSystem::RECEIVE_NOTE_TRANSACTION_EDIT,
    InventoryManagementSystem::RECEIVE_NOTE_TRANSACTION_KIV,
    InventoryManagementSystem::RECEIVE_NOTE_TRANSACTION_PRINTABLE,
    InventoryManagementSystem::RN_KIV_SHOW,
    InventoryManagementSystem::RN_KIV_RECOVER,
  ]
  
  validates :receive_note_no, :presence => true, :uniqueness => true
  
  def self.ordered(search)
    search.order("receive_note_no DESC")
  end
  
  def self.find_company_id(vendor_id)
    order("receive_note_no DESC").find_all_by_trade_company_id(vendor_id)
  end
  
  def self.implement_product_id
    pri = PurchaseRequisitionItem.where("status = ?", PurchaseRequisitionItem::RECEIVE_NOTE)
    if pri.present?
      pri.each do |item|
        if item.product_id.blank?
          i_desc = item.description
          pv = ProductVendor.find_all_by_trade_company_id(item.trade_company_id)
          if pv.present?
            pv.each do |item2|
              if item2.product.desc.to_s == i_desc.to_s
                item.update_attributes(:product_id => item2.product_id)
              end
            end
          end
        end
      end
    end
  end
  
  def self.entry_value(rn_qty, rn_checked, rn_id)
    if rn_checked.present?
      rn_checked.each do |ck|
        rn_qty.each do |pri_id, content|
          if pri_id.present?
            if pri_id.to_i == ck.to_i # if checked is true
              item = PurchaseOrderItemLine.find_by_purchase_requisition_item_id(pri_id.to_i)
              
              order_qty    = item.purchase_requisition_item.quantity rescue '-'
              prod_id      = item.purchase_requisition_item.product_id rescue '-'
              prod_qty     = item.purchase_requisition_item.product.current_stock rescue '-'
              part_no      = item.purchase_requisition_item.product.part_no rescue '-'
              received_qty = content[:qty].to_i
              sum          = prod_qty + received_qty
                
              if item.receive_note_items.present?
                balance = order_qty - item.receive_note_items.map(&:received_qty).sum() - received_qty
              else
                balance = order_qty - received_qty
              end

              rni = ReceiveNoteItem.create!(:receive_note_id => rn_id, :received_qty => received_qty, :purchase_order_item_line_id => item.id, :vendor_part_no => part_no)
              InventoryHistory.create!(:receive_note_item_id => rni.id, :product_id => prod_id, :stock_in => received_qty, :stock_out => 0, :amount => sum, :inventory_issue_id => InventoryIssue.find_by_description("RECEIVED NOTE").id, :created_at => rni.receive_note.rn_date)
              item.purchase_requisition_item.product.update_attributes(:current_stock => sum)
              
              if balance == 0
                item.purchase_requisition_item.update_attributes(:status => PurchaseRequisitionItem::RECEIVED_FULL)
                rni.purchase_order_item_line.update_attributes(:checked => TRUE, :receive_note_id => rn_id)
                self.check_pr_item_full(item.purchase_requisition_item)
              else
                item.purchase_requisition_item.update_attributes(:status => PurchaseRequisitionItem::RECEIVED_PARTIAL)
                rni.purchase_order_item_line.update_attributes(:checked => FALSE, :receive_note_id => rn_id)
              end
            end
          end
        end
      end
    end
  end
  
  def self.check_pr_item_full(pri, rf = 0)
    pr = pri.purchase_requisition
    num = pr.purchase_requisition_items.count
    pr.purchase_requisition_items.each {|p| rf += 1 if p.status == PurchaseRequisitionItem::RECEIVED_FULL }
    pr.update_attributes(:status => PurchaseRequisition::COMPLETED) if num - rf == 0
  end
  
  def self.check_rn_qty(rn_qty, rn_checked)
    if rn_checked.present?
      rn_checked.each do |ck|
        rn_qty.each do |pri_id, content|
          if pri_id.present?
            if pri_id.to_i == ck.to_i # if checked is true
              item = PurchaseOrderItemLine.find_by_purchase_requisition_item_id(pri_id.to_i)
              received_qty = content[:qty].to_i
              order_qty = item.purchase_requisition_item.quantity
              
              if item.receive_note_items.present?
                stock_qty = item.receive_note_items.map(&:received_qty).sum()
              else
                stock_qty = 0
              end
              
              if received_qty == 0 or received_qty.blank?
                return false, "RN Qty can't blank or zero."
                break;
              else
                unless received_qty <= order_qty - stock_qty
                  return false, "Either of your RN Qty is overweight."
                  break;
                end
              end
            end
          end
        end
      end
    end
  end
  
  def self.all_vendor
    select(:trade_company_id).uniq.map { |c| [ c.trade_company.name, c.trade_company.id ] }
  end
  
  def self.uniq_updater
    array = []
    rn = self.select('DISTINCT updated_by');
    if rn.present?
      rn.each do |prn|
        user = User.find(prn.updated_by)
        array << [user.name, prn.updated_by]
      end
    end
    return array
  end
  
#  def self
#     array = []
#    if option == 1
#      @group_vendor = .where("status = ? or status = ?", PurchaseRequisitionItem::RECEIVE_NOTE, PurchaseRequisitionItem::RECEIVED_PARTIAL).group_by(&:trade_company_id)
#      if @group_vendor.present?
#        @group_vendor.each do |k, v|
#          vn = trade_company_vendor.find_by_id(k)
#          array << [vn.name, vn.id]
#        end
#      end
#    elsif option == 2
#      @group_vendor = PurchaseRequisitionItem.where("status = ? or status = ?", PurchaseRequisitionItem::RECEIVE_NOTE, PurchaseRequisitionItem::RECEIVED_PARTIAL).group_by(&:trade_company_id)
#      if @group_vendor.present?
#        @group_vendor.each do |k, v|
#          vn = trade_company_vendor.find_by_id(k)
#          array2 << [vn.code, vn.id]
#        end
#      end
#    else
#     return false
#    end
#  end
  
  private 
  
  def uppercase_text
    self.vendor_delivery_no.upcase!
  end
  
end
