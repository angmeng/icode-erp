class SalesOrder < ActiveRecord::Base
  before_save   :uppercase_text
  before_update :uppercase_text
  
  attr_accessible :currency_id, :purchase_order_no, :purpose, :revision, :sales_order_no, :sales_rep, :trade_company_id, :trade_term_id, :updated_by, :so_date, :status, :lot_no, :mfg_date, :exp_date
  
  validates :so_date, :trade_company_id, :revision, :purpose, :currency_id, :presence => true
  
  belongs_to :trade_company
  belongs_to :currency
  belongs_to :trade_term
  
  has_many :sales_order_items, :dependent => :destroy
  
  ACTIVE = 'Active'
  IN_PROGRESS = 'IP'
  SALES = 1
  
  def running_update
    update_attributes(:status => SalesOrder::IN_PROGRESS)
  end
  
  def details_data
    sales_order_items
  end
  
  def uppercase_text
    self.purchase_order_no.upcase! if self.purchase_order_no?
    self.sales_rep.upcase! if self.sales_rep?
  end
  
  def self.running_sales_order_items(datarow, sales_order)
    if datarow.present?
      datarow.each do |key, content|
        s_order = sales_order.sales_order_items.build(:product_id => content[:product_id], :quantity => content[:quantity], :unit_price => content[:unit_price], :eta => content[:eta_date], :customer_po => content[:customer_po], :part_no => content[:part_no], :status => SalesOrderItem::PENDING)
        if s_order.valid?
          return true
        else
          return false, msg = s_order.errors.full_messages
          break;
        end
      end
    end
  end
  
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
end
