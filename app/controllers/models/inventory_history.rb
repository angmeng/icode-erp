class InventoryHistory < ActiveRecord::Base
  attr_accessible :product_id, :receive_note_item_id, :stock_in, :stock_out, :amount, :inventory_issue_id, :created_at
  
  validates :product_id, :presence => true
  
  ACTIVE = "ACTIVE"
  KEEP_IN_VIEW = "KIV"
  
  ROLE = [
    InventoryManagementSystem::INVENTORY_MENU,
    InventoryManagementSystem::INVENTORY_NEW,
    InventoryManagementSystem::INVENTORY_TRANSACTION,
    InventoryManagementSystem::INVENTORY_KIV_VIEW,
    InventoryManagementSystem::INVENTORY_NEW_ADD,
    InventoryManagementSystem::INVENTORY_TRANSACTION_SHOW,
    InventoryManagementSystem::INVENTORY_TRANSACTION_EDIT,
    InventoryManagementSystem::INVENTORY_TRANSACTION_KIV,
    InventoryManagementSystem::INVENTORY_TRANSACTION_PRINTABLE,
    InventoryManagementSystem::INVENTORY_TRANSACTION_KIV_SHOW,
    InventoryManagementSystem::INVENTORY_TRANSACTION_KIV_RECOVER
  ]
  
  belongs_to :receive_note_item
  belongs_to :product
  belongs_to :inventory_issue
  
  default_scope order("created_at DESC")
  
  def self.check_current_stock(product_id, in_out, inventory_history)
    if in_out.present?
      product = Product.find(product_id)
      if in_out == "IN"
        if inventory_history.stock_in?
          if inventory_history.stock_in > 0
            inventory_history.amount = product.current_stock + inventory_history.stock_in
            inventory_history.stock_out = 0
            return true
          else
            return false, "The value is overflow."
          end
        else
          return false, "Stock In can't blank."
        end
      else
        if inventory_history.stock_out?
          if product.current_stock >= inventory_history.stock_out and inventory_history.stock_out > 0
            inventory_history.amount = product.current_stock - inventory_history.stock_out
            inventory_history.stock_in = 0
            return true
          else
            return false, "The value is over the current stock or not zero."
          end
        else
          return false, "Stock Out can't blank."
        end
      end
    else
      return false, "Type can't blank.."
    end
  end
  
  def self.grouping
    order('created_at DESC').select('product_id').uniq
  end
  
  def self.find_product(select_product)
    order('created_at DESC').where(:product_id => select_product)
  end
end
