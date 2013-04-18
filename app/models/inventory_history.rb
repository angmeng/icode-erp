class InventoryHistory < ActiveRecord::Base
  attr_accessible :product_id, :receive_note_item_id, :stock_in, :stock_out, :amount, :inventory_issue_id, :created_at
  
  validates :product_id, :presence => true
  
  ACTIVE = "ACTIVE"
  KEEP_IN_VIEW = "KIV"
  
  ROLE = [
    InventoryManagementSystem::INVENTORY_MENU,
    InventoryManagementSystem::INVENTORY_TRANSACTION,
    InventoryManagementSystem::INVENTORY_NEW,
    InventoryManagementSystem::INVENTORY_TRANSACTION_SHOW,
    InventoryManagementSystem::INVENTORY_TRANSACTION_EDIT,
    InventoryManagementSystem::INVENTORY_TRANSACTION_PRINTABLE,
    InventoryManagementSystem::INVENTORY_KIV_VIEW,
    InventoryManagementSystem::INVENTORY_TRANSACTION_KIV_SHOW,
    InventoryManagementSystem::INVENTORY_TRANSACTION_KIV_RECOVER
  ]
  
  belongs_to :receive_note_item
  belongs_to :product
  belongs_to :inventory_issue
  
  default_scope order("created_at DESC")
  
  def self.grouping
    order('created_at DESC').select('product_id').uniq
  end
  
  def self.find_product(select_product)
    order('created_at DESC').where(:product_id => select_product)
  end
end
