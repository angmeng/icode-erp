class DeliveryOrderItem < ActiveRecord::Base
  attr_accessible :balance_qty, :client_lot, :client_po, :delivery_qty, :department, :dept_current_stock, :do_status, :gen_current_stock, :no_of_carton, :order_qty, :part_no, :sales_order_item_id, :so_date, :unit_price, :delivery_order_id
  
  belongs_to :delivery_order
  belongs_to :sales_order_item
  
  has_one :outgoing_reject_item
  has_many :ste_customer_histories
  has_many :sales_order_items, :through => :ste_customer_histories
  
  validates :sales_order_item_id, :delivery_qty, :unit_price, :presence => true
  
  def do_pending?
    do_status == DataStatus::DOI_PENDING
  end
  
  def do_processing?
    do_status == DataStatus::DOI_PROCESSING
  end
  
  def do_completed?
    do_status == DataStatus::DOI_COMPLETED
  end
  
  def so_balance_qty_is_zero?
    balance_qty == 0
  end
  
  def decode_doi
    case do_status
    when DataStatus::DOI_PENDING
      "Pending"
    when DataStatus::DOI_PROCESSING
      "Processing"
    when DataStatus::DOI_COMPLETED
      "Completed"
    else
      "nothing"
    end
  end
end
