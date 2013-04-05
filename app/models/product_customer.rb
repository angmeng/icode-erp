class ProductCustomer < ActiveRecord::Base
  attr_accessible :product_id, :trade_company_id, :selling_price, :eff_date, :currency_id
  
  belongs_to :trade_company
  belongs_to :product
  belongs_to :currency

  def self.ordering_attr(search)
    if search.trade_company_id_equals.present?
      search.joins(:product => :product_combobox).order('product_code')
    else
      search.joins([:trade_company, :product => :product_combobox]).order('trade_companies.name, product_code')
    end
  end
  
  def self.fg_combobox(company_id)
    arr_trade = []
    if company_id.present?
      trade = where(:trade_company_id => company_id)
    else
      trade = all
    end
    if trade.present?
      trade.each do |t|
        if t.product.present?
          if t.product.product_combobox.present?
            arr_trade << [t.product.product_combobox.product_code, t.product.id]
          end
        end
      end
      return arr_trade
    end
  end
  
  def self.take_unit_price(product_id, company_id)
    return ProductCustomer.find_by_product_id_and_trade_company_id(product_id, company_id)
  end
end
