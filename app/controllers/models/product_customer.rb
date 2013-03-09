class ProductCustomer < ActiveRecord::Base
  attr_accessible :product_id, :trade_company_id, :selling_price, :eff_date
  
  belongs_to :trade_company
  belongs_to :product
  
#  def self.ordered_with_customer_company
#    arr_cc = []
#    cc = select("trade_company_id").uniq
#    if cc.present?
#      cc.each do |c|
#        code = c.trade_company.code 
#        name = c.trade_company.name
#        string = "#{code} - #{name}"
#        arr_cc << [name, string]
#      end
#      return arr_cc
#    end
#  end
  
#  def self.selection_company
#    arr_cc = []
#    cc = select("trade_company_id").uniq
#    if cc.present?
#      cc.each do |c|
#        id = c.trade_company.id 
#        name = c.trade_company.name
#        arr_cc << [name, id]
#      end
#      return arr_cc
#    end
#  end
  
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
