class SalesOrderItem < ActiveRecord::Base
  before_save   :uppercase_text
  before_update :uppercase_text
  
  attr_accessible :complete_qty, :current_stock, :customer_po, :description, :eta, :part_no, :product_id, :quantity, :sales_order_id, :status, :unit_measurement_id, :unit_price, :user_id, :trade_company_id, :um_name
  
  belongs_to :user
  belongs_to :product
  belongs_to :unit_measurement
  belongs_to :sales_order
  belongs_to :trade_company
  
  validates :product_id, :quantity, :unit_price, :eta, :unit_measurement_id, :presence => true
  
  PENDING  = "PD"
  PRODUCTION = 'PDT'
  IN_PROCESS = "IP"
  APPROVED = "A"
  KEEP_IN_VIEW = "KIV"
  
  scope :db_pending, where(:status => SalesOrderItem::PENDING)
  
  def uppercase_text
    self.customer_po.upcase! if self.customer_po.present?
    self.part_no.upcase!     if self.part_no.present?
  end
end
