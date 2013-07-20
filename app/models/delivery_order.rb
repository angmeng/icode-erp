class DeliveryOrder < ActiveRecord::Base
  before_save :uppercase_text
  before_update :uppercase_text
  
  attr_accessible :bk_two, :currency_id, :do_no, :sales_rep, :sales_tax, :sales_tax_exemption_id, :tport_c, :trade_company_id, :trade_term_id, :transport_id, :type_of_sale_id, :updated_by, :do_date, :status, :authorize_print
  
  has_many :delivery_order_items, :dependent => :destroy
  has_many :history_invoices
  has_many :statement_of_accounts, :dependent => :destroy
  
  belongs_to :trade_company
  belongs_to :type_of_sale
  belongs_to :currency
  belongs_to :trade_term
  belongs_to :transport
  belongs_to :sales_tax_exemption
  
  ACTIVE        = "Active"
  KEEP_IN_VIEW  = "KIV"
  
  default_scope order("do_no DESC")
  
  self.per_page = 50
  
  def self.search_do(search)
    search.where(:status => DeliveryOrder::ACTIVE)
  end
  
  def self.search_do_kiv(search)
    search.where(:status => DeliveryOrder::KEEP_IN_VIEW)
  end

  # def self.authorize_print
  #   if authorize_print == true
  #     authorize_print.update_attributes
  # end

 #* &:delivery_qty + &:sales_tax - &:tport_c 
  def calculate_sum_of_doi
      
      a = delivery_order_items.collect {|c| (c.unit_price.to_f * c.delivery_qty.to_f) }
      a << tport_c.to_f + sales_tax.to_f
      return a.sum()
    #     delivery_order_items.each do |doi|
    #   doi.map(&:unit_price).sum()
    # end
  end

    # if type_of_sale_id == TypeOfSale::SALES_WITH_TAX
    #   delivery_order_items.each do |p|
    #     if type_of_sale_id == TypeOfSale::SALES_WITH_TAX
    #     arr1 << p.delivery_qty.to_f
  
      
    #   elsif type_of_sale == TypeOfSale::SALES_WITH_TAX
    #     arr1 << delivery_qty.to_f

    #   elsif type_of_sale == TypeOfSale::OTHERS
    #     arr2 << delivery_qty.to_f

    #   elsif type_of_sale == TypeOfSale::FREE_TRADE_ZONE
    #     arr3 << delivery_qty.to_f
    
    #   elsif type_of_sale == TypeOfSale::LMW_EXEMPTION_WL
    #     arr4 << delivery_qty.to_f
      
    #   elsif type_of_sale == TypeOfSale::CJ5_LICENCE_MANUFACTURER
    #     arr5 << delivery_qty.to_f
   
    #   elsif type_of_sale == TypeOfSale::EXPORT_SALES
    #     arr6 << delivery_qty.to_f
  
    #   elsif type_of_sale == TypeOfSale::IMPORT
    #     arr7 << delivery_qty.to_f

    #   elsif type_of_sale == TypeOfSale::LOCAL_SALES_MAS
    #      arr8 << delivery_qty.to_f
    #   end

  
  def uppercase_text
    self.sales_rep.upcase! if self.sales_rep.present?
  end
  
  def manage_outgoing_reject
    generate_json ||= []
    if delivery_order_items.present?
      delivery_order_items.each do |doi|
        generate_json << { :do_no => doi.try(:delivery_order).try(:do_no), 
                           :doi_id => doi.id,
                           :soi_id => doi.try(:sales_order_item_id),
                           :product_id => doi.try(:sales_order_item).try(:product).try(:product_combobox).try(:product_code),
                           :description => doi.try(:sales_order_item).try(:product).try(:desc), 
                           :do_date => doi.try(:delivery_order).try(:do_date),
                           :inv_delv_qty => doi.try(:delivery_qty),
                           :unit_measurement => doi.try(:sales_order_item).try(:unit_measurement).try(:code),
                           :inv_unit_price => doi.try(:unit_price),
                           :so_bal_qty => doi.try(:balance_qty),
                           :do_status => doi.try(:decode_doi),
                           :current_stock => doi.try(:sales_order_item).try(:product).try(:current_stock),
                           :client_lot => (doi.client_lot || ''),
                           :client_part => (doi.part_no || ''),
                           :client_po => (doi.client_po || '')
        }
      end
    end
    return generate_json
  end
end