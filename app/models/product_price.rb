class ProductPrice < ActiveRecord::Base
  attr_accessible :currency_id, :price_in, :product_category_id, :trade_company_id, :unit_price
  
  belongs_to :trade_company
  belongs_to :product_category
  belongs_to :currency
  
  AUD = 1
  RM = 2
  SGD = 3
  USD = 4
  YEN = 5
  
  def self.currency_price(this_currency)
    case this_currency
      when 1
          return "&#163"   #Pound Symbol (£)
      when 2
          return "&#128;"  #Euro Symbol (€)
      else
          return "$"
    end
  end
  
  
end
