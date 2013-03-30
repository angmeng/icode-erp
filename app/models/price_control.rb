class PriceControl < ActiveRecord::Base
  before_save   :uppercase_text
  before_update :uppercase_text
  
  attr_accessible :currency_id, :pp_date, :pp_no, :reference, :status, :trade_company_id, :user_id
  
  validates :currency_id, :pp_no, :trade_company_id, :user_id, :presence => true
  validates :pp_date, :presence => true
  
  has_many :price_control_items, :dependent => :destroy
  
  belongs_to :currency
  belongs_to :trade_company
  belongs_to :user
  
  ACTIVE = "Active"
  CLOSE = "Close"
  KEEP_IN_VIEW = "KIV"
  
  default_scope order("pp_no DESC")
  
  self.per_page = 50
  
  scope :db_active, where(:status => PriceControl::ACTIVE)
  scope :db_kiv, where(:status => PriceControl::KEEP_IN_VIEW)
  scope :db_close, where(:status => PriceControl::CLOSE)
  
  def self.search_price_control(search)
    search.where(:status => PriceControl::ACTIVE)
  end
  
  def self.search_price_control_kiv(search)
    search.where(:status => PriceControl::KEEP_IN_VIEW)
  end
  
  # PS: price_control_items used for histories
  def self.running_price_control_items(data, price_control)
    if data.present?
      data.each do |key, content|
        p_control = price_control.price_control_items.build(:product_id => content[:product_id], :old_unit_price => content[:old_unit_price], :old_eff_date => content[:old_eff_date], :new_unit_price => content[:new_unit_price], :new_eff_date => content[:new_eff_date])
        unless p_control.valid?
          return false, msg = p_control.errors.full_messages
          break;
        end
      end  
      return price_control
    end
  end
  
  def self.generating_product_customer(price_control)
    company_id = price_control.trade_company_id  # must be customer ID
    
    price_control.price_control_items.each do |price_control_item|
      product_id = price_control_item.product_id
      prod_cus = ProductCustomer.find_by_product_id_and_trade_company_id(product_id, company_id)
      if prod_cus.present?
        prod_cus.update_attributes!(:selling_price => price_control_item.new_unit_price, :eff_date => price_control_item.new_eff_date)
      else
        ProductCustomer.create!(:product_id => product_id, :trade_company_id => company_id, :selling_price => price_control_item.new_unit_price, :eff_date => price_control_item.new_eff_date)
      end
    end
  end
  
  def self.take_old_up_n_eff_date(company_id, product_id)
    return ProductCustomer.find_by_product_id_and_trade_company_id(product_id, company_id)
  end

  def uppercase_text
    self.reference.upcase! if self.reference.present?
  end
end
