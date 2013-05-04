class SalesOrder < ActiveRecord::Base
  before_save   :uppercase_text
  before_update :uppercase_text
  
  attr_accessible :currency_id, :purchase_order_no, :purpose, :revision, :sales_order_no, :sales_rep, :trade_company_id, :trade_term_id, :updated_by, :so_date, :status
  
  validates :so_date, :trade_company_id, :revision, :purpose, :currency_id, :presence => true
  
  belongs_to :trade_company
  belongs_to :currency
  belongs_to :trade_term
  
  has_many :sales_order_items, :dependent => :destroy
  
  ACTIVE = 'Active'
  IN_PROGRESS = 'IP'
  KEEP_IN_VIEW = "KIV"
  COMPLETED = 'CPD'
  SALES = 1
  
  default_scope order("sales_order_no DESC")
  
  self.per_page = 50
  
  def self.db_active(search)
    search.where("status = ? or status = ?", SalesOrder::ACTIVE, SalesOrder::COMPLETED)
  end
  
  def self.db_kiv(search)
    search.where(:status => SalesOrder::KEEP_IN_VIEW)
  end
  
  def running_update
    update_attributes(:status => SalesOrder::IN_PROGRESS)
  end
  
  def details_data
    sales_order_items
  end
  
  def uppercase_text
    self.purchase_order_no.upcase!  if self.purchase_order_no.present?
    self.sales_rep.upcase!          if self.sales_rep.present?
  end
  
#  def self.running_sales_order_items(datarow, sales_order)
#    if datarow.present?
#      sales_order.sales_order_items.delete_all if sales_order.sales_order_items.present?
#      datarow.each do |key, content|
#        s_order = sales_order.sales_order_items.build(:product_id => content[:product_id], :quantity => content[:quantity], :unit_measurement_id => content[:unit_measurement_id], :unit_price => content[:unit_price], :eta => content[:eta_date], :customer_po => content[:customer_po], :part_no => content[:part_no], :status => SalesOrderItem::PENDING)
#        if s_order.valid?
#          return true
#        else
#          return false, msg = s_order.errors.full_messages
#          break;
#        end
#      end
#    end
#  end
  
  def self.running_price_control_items(data, price_control)
    if data.present?
      data.each do |key, content|
        p_control = price_control.price_control_items.build(:product_id => content[:product_id], :old_unit_price => content[:old_unit_price], :old_eff_date => content[:old_eff_date], :new_unit_price => content[:new_unit_price], :new_eff_date => content[:new_eff_date])
        if p_control.valid? 
          return true
        else
          return false, msg = p_control.errors.full_messages
          break;
        end
      end  
    end
  end
  
  def self.so_pid_desc
    mix = []
    sale_orders = SalesOrder.where(:status => SalesOrder::ACTIVE)
    sale_orders.each do |so|
      so_no = so.sales_order_no
      so.sales_order_items.each do |soi|
        mix << ["[#{so_no rescue '-'}][#{soi.product.product_combobox.product_code rescue '-'}] #{soi.product.desc rescue '-'}", soi.id] if soi.is_pending?
      end
    end
    return mix
  end
  

end
