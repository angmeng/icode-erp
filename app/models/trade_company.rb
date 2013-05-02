class TradeCompany < ActiveRecord::Base
  before_save :uppercase_text
  before_update :uppercase_text
  
  attr_accessor :ste_name
  
  attr_accessible :address_3, :code, :name, :sales_rep, :contact_attributes,
    :sales_tax_no, :status, :trade_term_id, :type_of_sale_id, :customer_approval, 
    :company_reg_no, :payment_type_id, :opening_ac_date, :opening_ac_amount, :limit_amount, :banking_name, 
    :banking_account, :email, :user_type, :sales_tax_exemption_id, :sales_tax_licence_no, :warehouse_licence_no, 
    :mfg_warehouse_licence_no, :subcon, :website, :certification, :performance_monitoring, :contact_person,
    :tel_area_code_one, :tel_no_1, :tel_area_code_two, :tel_no_2, :fax_area_code, :fax_no, :decimal_point,
    :address_1, :postcode_one, :city_one, :state_one, :country_one, 
    :address_2, :postcode_two, :city_two, :state_two, :country_two
  
  belongs_to :type_of_sale
  belongs_to :trade_term
  belongs_to :payment_type
  belongs_to :sales_tax_exemption
  
  has_one  :product_price
  has_one  :purchase_order
  has_one  :purchase_requisition
  has_one  :quotation_request_form
  has_one  :price_control
  has_one  :delivery_order
  has_one  :credit_note
  has_one  :receipt
  has_one  :payment_received
  has_one  :sales_tax_exemption_line
  
  has_many :product_vendors
  has_many :product_customers
  has_many :purchase_requisition_items
  has_many :receive_notes
  has_many :sales_orders
  
  has_many :contacts, :dependent => :destroy
  
  validates_associated :contacts
  
  validates :code, :name, :address_1, :tel_area_code_one, :tel_no_1, :contact_person, :presence => true
  validates :code, :name, :uniqueness => {:case_sensitive => false }
  validates :code, :length => { :in => 5..6 }
  validates :address_1, :address_2, :address_3, :length => { :maximum => 255 }
  validates :name, :length => { :in => 2..50 }
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :messages => "Email is invalid." }, :allow_blank => true
  validates :tel_area_code_one,                 :length => { :in => 2..3 }
  validates :tel_area_code_two, :fax_area_code, :length => { :in => 2..3 }, :allow_blank => true
  validates :tel_no_1,          :length => { :in => 7..9 }
  validates :tel_no_2, :fax_no, :length => { :in => 7..9 }, :allow_blank => true
  validates :company_reg_no, :length => { :maximum => 20 }
  
  def uppercase_text
    self.code.upcase! if self.code.present?
    self.name.upcase! if self.name.present?
    self.address_1.upcase! if self.address_1.present?
    self.address_2.upcase! if self.address_2.present?
    self.contact_person.upcase! if self.contact_person.present?
    self.sales_rep.upcase! if self.sales_rep.present?
    self.company_reg_no.upcase! if self.company_reg_no.present?
    self.sales_tax_licence_no.upcase! if self.sales_tax_licence_no.present?
    self.warehouse_licence_no.upcase! if self.warehouse_licence_no.present?
    self.mfg_warehouse_licence_no.upcase! if self.mfg_warehouse_licence_no.present?
    self.city_one.upcase! if self.city_one.present?
    self.state_one.upcase! if self.state_one.present?
    self.country_one.upcase! if self.country_one.present?
    self.city_two.upcase! if self.city_two.present?
    self.state_two.upcase! if self.state_two.present?
    self.country_two.upcase! if self.country_two.present?
  end
  
  KIV = 0
  ACTIVE = 1
  INACTIVE = 2
  
  SUPPLIER = "SUPPLIER"
  CUSTOMER = "CUSTOMER"
  
#  ROLE = [
#    InventoryManagementSystem::TRADE_COMPANY_MENU,
#    InventoryManagementSystem::VENDOR_NEW,
#    InventoryManagementSystem::VENDOR_LISTING,
#    InventoryManagementSystem::VENDOR_KIV,
#    InventoryManagementSystem::VENDOR_NEW_ADD,
#    InventoryManagementSystem::VENDOR_SHOW,
#    InventoryManagementSystem::VENDOR_EDIT,
#    InventoryManagementSystem::VENDOR_ACTION_KIV,
#    InventoryManagementSystem::VENDOR_PRINTABLE,
#    InventoryManagementSystem::VENDOR_KIV_SHOW,
#    InventoryManagementSystem::VENDOR_KIV_RECOVER,
#    
#    InventoryManagementSystem::CUSTOMER_NEW,
#    InventoryManagementSystem::CUSTOMER_LISTING,
#    InventoryManagementSystem::CUSTOMER_KIV,
#    InventoryManagementSystem::CUSTOMER_NEW_ADD,
#    InventoryManagementSystem::CUSTOMER_SHOW,
#    InventoryManagementSystem::CUSTOMER_EDIT,
#    InventoryManagementSystem::CUSTOMER_ACTION_KIV,
#    InventoryManagementSystem::CUSTOMER_PRINTABLE,
#    InventoryManagementSystem::CUSTOMER_KIV_SHOW,
#    InventoryManagementSystem::CUSTOMER_KIV_RECOVER
#  ]
  
  def self.get_all_companies(this)
    product_array = []
    this.each do |pv|
      product_array << { :company_name => "#{pv.name}" }
    end
    return product_array
  end
  
  default_scope :order => "name"
  
#  ================================= SEARCH FUNCTION =============================================

  def self.search_ordered_with_vendor_name(search)
    search.where(:user_type => TradeCompany::SUPPLIER, :status => TradeCompany::ACTIVE)
  end
  
  def self.search_ordered_with_customer_name(search)
    search.where(:user_type => TradeCompany::CUSTOMER, :status => TradeCompany::ACTIVE)
  end
  
  def self.search_ordered_with_kiv_vendors(search)
    search.where(:user_type => TradeCompany::SUPPLIER, :status => TradeCompany::KIV)
  end
  
  def self.search_ordered_with_kiv_cutomers(search)
    search.where(:user_type => TradeCompany::CUSTOMER, :status => TradeCompany::KIV)
  end
  
#  =================================================================================================

#  ================================= TRADE COMPANY =============================================
  def self.ordered_with_both
    where(:status => TradeCompany::ACTIVE)
  end
  
  def self.ordered_with_vendor_name
    where(:user_type => TradeCompany::SUPPLIER, :status => TradeCompany::ACTIVE)
  end
  
  def self.ordered_with_customer_name
    where(:user_type => TradeCompany::CUSTOMER, :status => TradeCompany::ACTIVE)
  end
  
  def self.ordered_with_subcon_name
    where(:user_type => TradeCompany::CUSTOMER, :status => TradeCompany::ACTIVE, :subcon => TRUE)
  end
  
  def self.ordered_with_kiv_vendors
    where(:user_type => TradeCompany::SUPPLIER, :status => TradeCompany::KIV)
  end
  
  def self.ordered_with_kiv_cutomers
    where(:user_type => TradeCompany::CUSTOMER, :status => TradeCompany::KIV)
  end
  
  def self.vendor_and_customer_with_code
    combobox = self.ordered_with_both
    mix = combobox.collect { |pcombo| ["[#{pcombo.code}] #{pcombo.name}", pcombo.id] }
    return mix
  end
  
  def self.vendor_with_code
    combobox = self.ordered_with_vendor_name
    mix = combobox.collect { |pcombo| ["[#{pcombo.code}] #{pcombo.name}", pcombo.id] }
    return mix
  end
  
  def self.vendor_with_code_and_selection_name
    combobox = self.ordered_with_vendor_name
    mix = combobox.collect { |pcombo| ["[#{pcombo.code}] #{pcombo.name}", pcombo.name] }
    return mix
  end
  
  def self.customer_with_code
    combobox = self.ordered_with_customer_name
    mix = combobox.collect { |pcombo| ["[#{pcombo.code}] #{pcombo.name}", pcombo.id] }
    return mix
  end
  

  
  def self.valid_code(change_company_code)
    tc = TradeCompany.find_by_code(change_company_code.new_code)
    if tc.present?
      return false, "This code has taken already."
    else
      return true
    end
  end
  
  def adding_contact(data)
    if data.present?
      contacts.delete_all if contacts.present?
      data.each do |row, content|
        if content[:contact_department].present? and content[:contact_name].present? and content[:contact_phone_area_code].present? and content[:contact_phone_no].present?
          contacts.build( :department => content[:contact_department], :name => content[:contact_name], :email => content[:contact_email], :phone_area_code => content[:contact_phone_area_code], :phone_no => content[:contact_phone_no], :mobile_area_code => content[:contact_mobile_area_code], :mobile_no => content[:contact_mobile_no])
        end
      end
    end
  end
  
  def loading_ste
    if sales_tax_exemption_line.present?
      if sales_tax_exemption_line.validate_condition == true
        if sales_tax_exemption_line.sales_tax_exemption.present?
          return "[#{sales_tax_exemption_line.sales_tax_exemption.running_no}] #{sales_tax_exemption_line.sales_tax_exemption.sales_tax_exemption_no}"
        end
      else
        if sales_tax_exemption_line.sales_tax_exemption.present?
          return "stop_ste", "The Sales Tax Exemption [#{sales_tax_exemption_line.sales_tax_exemption.running_no}] was invalid."
        end
      end
    end
  end
  
end