class IncomingReject < ActiveRecord::Base
  attr_accessible :balance_qty, :bk_one, :client_part_no, :current_stock, :incoming_reject_no, :job_order_no, :order_qty, :purchase_requisition_item_id, :purpose, :returned_qty, :updated_by, :vendor_delivery_no, :ir_date, :sales_tax_exemption_no
  
  belongs_to :purchase_requisition_item
    
  ROLE = [
    InventoryManagementSystem::INCOMING_REJECT_SHOW, 
    InventoryManagementSystem::INCOMING_REJECT_EDIT,
    InventoryManagementSystem::INCOMING_REJECT_KIV,
    InventoryManagementSystem::INCOMING_REJECT_PRINTABLE,
    InventoryManagementSystem::INCOMING_REJECT_NEW
  ]
  
  PURCHASE = 1
  SUB_CON = 2
  
  validates :incoming_reject_no, :presence => true, :uniqueness => true
  
  def self.running_current_stock(product_id)
    if select_rn.present?
      select_rn.each do |ck|
        rtn_qty.each do |pri_id, content|
          if pri_id.present?
            if pri_id.to_i == ck.to_i
#              rni = ReceiveNoteItem.find(pri_id)
              

              
            end
          end
        end
      end
    end
  end
  
  #              item = PurchaseOrderItemLine.find_by_purchase_requisition_item_id(pri_id.to_i)
#              order_qty = item.purchase_requisition_item.quantity rescue '-'
#              prod_id = item.purchase_requisition_item.product_id rescue '-'
#              prod_qty = item.purchase_requisition_item.product.current_stock rescue '-'
#                

#              
#              sum = prod_qty + received_qty
#
#              rni = ReceiveNoteItem.create!(:receive_note_id => rn_id, :purchase_order_item_line_id => item.id, :received_qty => received_qty, :order_qty => order_qty, :vendor_part_no => "-")
#              rni.purchase_order_item_line.update_attributes(:checked => TRUE)
#              InventoryHistory.create!(:receive_note_item_id => rni.id, :product_id => prod_id, :stock_in => received_qty, :stock_out => 0, :amount => sum, :inventory_issue_id => InventoryIssue::RECEIVED_NOTE)
#              item.purchase_requisition_item.product.update_attributes(:current_stock => sum)
  
  def self.ordered
    order("incoming_reject_no DESC"). all
  end

  def self.check_returned_qty(select_rn, rtn_qty)
    if select_rn.present?
      select_rn.each do |ck|
        rtn_qty.each do |pri_id, content|
          if pri_id.present?
            if pri_id.to_i == ck.to_i
              rni = ReceiveNoteItem.find(pri_id)
              
              if content[:qty].to_i == 0 or content[:qty].blank?
                return false, "Your Returned Qty can't blank or zero."
                break;
              elsif content[:qty].to_i > rni.received_qty
                return false, "Your Returned Qty is overweight."
                break;
              else
                
              end
              
            end
          end
        end
      end
    end
  end
end
