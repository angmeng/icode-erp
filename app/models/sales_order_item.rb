class SalesOrderItem < ActiveRecord::Base
  before_save   :uppercase_text
  before_update :uppercase_text
  
  attr_accessible :sales_order_id, :product_id, :quantity, :unit_measurement_id, :eta, :unit_price, :status, :customer_po, :part_no, :remaining_qty
  
  belongs_to :user
  belongs_to :product
  belongs_to :unit_measurement
  belongs_to :sales_order
  belongs_to :trade_company
  
  validates :product_id, :quantity, :unit_price, :eta, :unit_measurement_id, :presence => true
  
  PENDING       = "PD"
  PRODUCTION    = 'PDT'
  IN_PROCESS    = "IP"
  APPROVED      = "A"
  COMPLETED     = "CPD"
  KEEP_IN_VIEW  = "KIV"
  
  def self.do_case(soi)
    case soi.status
    when "PD"
      "PENDING"
    when "PDT"
      "PRODUCTION"
    when "IP"
      "PROCESSING"
    when "A"
      "APPROVED"
    when "CPD"
      "COMPLETED"
    when "KIV"
      "KEEP IN VIEW"
    else
      "-"
    end
  end
  
  scope :db_pending, where(:status => SalesOrderItem::PENDING)
  
  def uppercase_text
    self.customer_po.upcase! if self.customer_po.present?
    self.part_no.upcase!     if self.part_no.present?
  end
  
  def is_pending?
    status == SalesOrderItem::PENDING
  end
  
  def is_completed?
    status == SalesOrderItem::COMPLETED
  end
end
