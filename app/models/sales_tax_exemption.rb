class SalesTaxExemption < ActiveRecord::Base
  before_save   :uppercase_text
  before_update :uppercase_text
  
  attr_accessible :apply_qty, :complete_qty, :period_end, :period_start, :sales_tax_exemption_no, :tarif_code, :trade_company_id, :unit_measurement_id, :valid_condition, :remaining_total, :perihal_barang, :registration_no, :status,
                  :running_no, :type_of_exemption, :company_type, :sales_tax_exemption_barangs_attributes

#  ROLE = [
#    InventoryManagementSystem::SALES_TAX_EXEMPTION_MENU,
#    InventoryManagementSystem::SALES_TAX_EXEMPTION_NEW,
#    InventoryManagementSystem::SALES_TAX_EXEMPTION_TRANSACTION_VALID,
#    InventoryManagementSystem::SALES_TAX_EXEMPTION_TRANSACTION_UNVALID,
#    InventoryManagementSystem::SALES_TAX_EXEMPTION_KIV,
#    InventoryManagementSystem::SALES_TAX_EXEMPTION_NEW_ADD,
#    
#    InventoryManagementSystem::SALES_TAX_EXEMPTION_TRANSACTION_VALID_SHOW_HISTORIES,
#    InventoryManagementSystem::SALES_TAX_EXEMPTION_TRANSACTION_VALID_SHOW,
#    InventoryManagementSystem::SALES_TAX_EXEMPTION_TRANSACTION_VALID_EDIT,
#    InventoryManagementSystem::SALES_TAX_EXEMPTION_TRANSACTION_VALID_KIV,
#    InventoryManagementSystem::SALES_TAX_EXEMPTION_TRANSACTION_VALID_PRINTABLE,
#    
#    InventoryManagementSystem::SALES_TAX_EXEMPTION_TRANSACTION_UNVALID_SHOW_HISTORIES,
#    InventoryManagementSystem::SALES_TAX_EXEMPTION_TRANSACTION_UNVALID_SHOW,
#    InventoryManagementSystem::SALES_TAX_EXEMPTION_TRANSACTION_UNVALID_EDIT,
#    InventoryManagementSystem::SALES_TAX_EXEMPTION_TRANSACTION_UNVALID_KIV,
#    InventoryManagementSystem::SALES_TAX_EXEMPTION_TRANSACTION_UNVALID_PRINTABLE,
#    
#    InventoryManagementSystem::STE_KIV_SHOW,
#    InventoryManagementSystem::STE_KIV_RECOVER
#  ]
  
#  validates :apply_qty, :numericality => { :greater_than => 0 }, :presence => true
#  validates :unit_measurement_id, :tarif_code, :perihal_barang, :presence => true

  validates :type_of_exemption, :sales_tax_exemption_no, :trade_company_id, :period_start, :period_end, :presence => true
  
  belongs_to :unit_measurement
#  belongs_to :trade_company
  has_one :trade_company
  
  has_many :sales_tax_exemption_barangs, :dependent => :destroy
  accepts_nested_attributes_for :sales_tax_exemption_barangs, :allow_destroy => true
  
  has_many :sales_tax_exemption_items, :dependent => :destroy
  has_many :products
  
  ACTIVE = "ACTIVE"
  KEEP_IN_VIEW = "KIV"
  CUSTOMER = "CUSTOMER"
  SUPPLIER = "SUPPLIER"
  
  default_scope order("running_no DESC")
  
  scope :ste_with_valid,   where("valid_condition = ? and status = ?", TRUE, SalesTaxExemption::ACTIVE)
  scope :ste_with_invalid, where("valid_condition = ? and status = ?", FALSE, SalesTaxExemption::ACTIVE)
  scope :type_supplier,    where("company_type = ?", SalesTaxExemption::SUPPLIER)
  scope :type_customer,    where("company_type = ?", SalesTaxExemption::CUSTOMER)
  
  def self.only_supplier(search)
    search.where("status = ?", SalesTaxExemption::ACTIVE).type_supplier
  end
  
  def self.only_customer(search)
    search.where("status = ?", SalesTaxExemption::ACTIVE).type_customer
  end
  
#  def self.order_supplier_valid(search)
#    search.where("valid_condition = ? and status = ?", TRUE, SalesTaxExemption::ACTIVE).type_supplier
#  end
#  
#  def self.order_customer_valid(search)
#    search.where("valid_condition = ? and status = ?", TRUE, SalesTaxExemption::ACTIVE).type_customer
#  end
#  
#  def self.order_supplier_invalid(search)
#    search.where("valid_condition = ? and status = ?", FALSE, SalesTaxExemption::ACTIVE).type_supplier
#  end
#  
#  def self.order_customer_invalid(search)
#    search.where("valid_condition = ? and status = ?", FALSE, SalesTaxExemption::ACTIVE).type_customer
#  end
  
  def self.order_kiv_supplier(search)
    search.where("status = ?", SalesTaxExemption::KEEP_IN_VIEW).type_supplier
  end
  
  def self.order_kiv_customer(search)
    search.where("status = ?", SalesTaxExemption::KEEP_IN_VIEW).type_customer
  end
  
  # category_type is non_operation n operation
  def self.perihal_barang_supplier
    prod_id = []
    @product_category = ProductCategory.where("level = ? and status = ?", 1, ProductCategory::ACTIVE)
    @product_category = @product_category.where("category_type = ? or category_type = ?", ProductCategory::NON_OPERATION, ProductCategory::OPERATION)
    self.looping_prod(@product_category, prod_id)
    return prod_id
  end
  
  # category_type is finish_goods
  def self.perihal_barang_customer
    prod_id = []
    @product_category = ProductCategory.where("level = ? and status = ?", 1, ProductCategory::ACTIVE)
    @product_category = @product_category.where("category_type = ?", ProductCategory::FINISH_GOOD)
    self.looping_prod(@product_category, prod_id)
    return prod_id
  end
  
  def self.looping_prod(prod_cat, prod_id)
    if prod_cat.present?
      prod_cat.each do |product_category|
        prod_id << self.collect_perihal_barang(product_category)
      end
    end
  end
  
  def self.collect_perihal_barang(pc)
    @ret = []
    @category = ProductCategory.find(pc.id)
    if @category.present?
      self.take_child_code(@category) 
      return @ret.join("-")
    end
  end
  
  def self.running_items(data, ste)
    if data.present?
      ste.sales_tax_exemption_barangs.delete_all if ste.sales_tax_exemption_barangs.present?
      
      data.each do |barang, content|
        ste.sales_tax_exemption_barangs.build(:perihal_barang => content[:perihal_barang], :apply_qty => content[:apply_qty], :complete_qty => content[:complete_qty], :unit_measurement_id => content[:unit_measurement_id], :tarif_code => content[:tarif_code])
      end
    end
  end
  
  private
  
  def self.take_child_code(pc)
    @ret << pc.code if pc.icon == ProductCategory::ICON_FOLDER
    
    if pc.children.present?
      pc.children.each do |child|
        self.take_child_code(child)
      end
    end
  end
  
  def uppercase_text
    self.type_of_exemption.upcase! if self.type_of_exemption.present?
    self.sales_tax_exemption_no.upcase! if self.sales_tax_exemption_no.present?
    self.registration_no.upcase! if self.registration_no.present?
  end
  
#  def self.formula(apply_qty, unit_measurement_id)
#    if apply_qty.present? and unit_measurement_id.present?
#      if UnitMeasurement.find_by(unit_measurement_id).code == "MT"
#        apply_qty * 1000
#      end
#    else
#      return 0
#    end
#  end
end
