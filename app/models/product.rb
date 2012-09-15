class Product < ActiveRecord::Base
  before_save :uppercase_text
  before_update :uppercase_text
  
  attr_accessible :code, :color_grade, :opening_stock, :current_stock, :cutoff_date, :desc, :model,  :part_no, :part_weight, :selling_price, :tarif_code, :unit_measurement_id, :version, :product_category_id, :product_vendors_attributes, :product_name, :unit_price, :sales_tax_exemption_id
  
  belongs_to :product_category
  belongs_to :unit_measurement
  belongs_to :sales_tax_exemption
  
  has_one    :purchase_requisition
  has_one    :sales_order_item
  
  has_many   :purchase_requisition_items
  has_many   :inventory_histories, :dependent => :destroy
  has_many   :sales_tax_exemption_items, :dependent => :destroy
  
  
  has_many :product_vendors, :dependent => :destroy
  accepts_nested_attributes_for :product_vendors, :reject_if => lambda { |a| a[:trade_company_id].blank? }, :allow_destroy => true
  
  validates :desc, :unit_measurement_id, :opening_stock, :current_stock, :part_weight, :selling_price, :presence => true
  validates :desc, :uniqueness => true
  validates :color_grade, :version, :model, :part_no, :tarif_code, :length => { :maximum => 40 }
  validates :desc, :length => { :maximum => 255 }
  
  ROLE = [
    InventoryManagementSystem::PRODUCT_MENU,
  
    InventoryManagementSystem::PRODUCT_NON_OPERATION,
    InventoryManagementSystem::PRODUCT_OPERATION,
    InventoryManagementSystem::PRODUCT_FINISH_GOOD,

    InventoryManagementSystem::PRODUCT_NON_OPERATION_PARENT_FOLDER,
    InventoryManagementSystem::PRODUCT_NON_OPERATION_SUB_FOLDER,
    InventoryManagementSystem::PRODUCT_NON_OPERATION_EDIT_SUB_FOLDER,
    InventoryManagementSystem::PRODUCT_NON_OPERATION_ADD_NEW_FILE,
    InventoryManagementSystem::PRODUCT_NON_OPERATION_EDIT_FILE,

    InventoryManagementSystem::PRODUCT_OPERATION_PARENT_FOLDER,
    InventoryManagementSystem::PRODUCT_OPERATION_SUB_FOLDER,
    InventoryManagementSystem::PRODUCT_OPERATION_EDIT_SUB_FOLDER,
    InventoryManagementSystem::PRODUCT_OPERATION_ADD_NEW_FILE,
    InventoryManagementSystem::PRODUCT_OPERATION_EDIT_FILE,

    InventoryManagementSystem::PRODUCT_FINISH_GOOD_PARENT_FOLDER, 
    InventoryManagementSystem::PRODUCT_FINISH_GOOD_SUB_FOLDER,
    InventoryManagementSystem::PRODUCT_FINISH_GOOD_EDIT_SUB_FOLDER,
    InventoryManagementSystem::PRODUCT_FINISH_GOOD_ADD_NEW_FILE,
    InventoryManagementSystem::PRODUCT_FINISH_GOOD_EDIT_FILE
  ]
    
  def uppercase_text
#    self.code.upcase! if self.code
    if self.desc.present?
      self.desc.upcase! 
      self.desc.strip!
    end
    self.color_grade.upcase! if self.color_grade.present?
    self.version.upcase! if self.version.present?
    self.model.upcase! if self.model.present?
    self.part_no.upcase! if self.part_no.present?
    self.tarif_code.upcase! if self.tarif_code.present?
  end
  
  def sample_action
    product_array_b = []
    product_vendors.each do |pv|
      product_array_b << { :id => pv.trade_company.id, :trade_company_name => pv.trade_company.name, :unit_price => pv.unit_price }
    end
    product_array_b
  end
  
  def self.product_data(product)
    collect_product = []
    product.each do |prod|
      collect_product << { :id => prod.id }
    end
    collect_product
  end
  
  def self.run_updating(comp, jump, product, product_category)
    a = comp.sn_product_id_no
    if jump == "yes"
      string1 = "%05d" % (a + 2)
      comp.update_attributes(:sn_product_id_no => a + 2)
      product.update_attributes(:code => string1)
      product.product_category.update_attributes(:code => string1)
    else
      string2 = "%05d" % (a + 1)
      comp.update_attributes(:sn_product_id_no => a + 1)
      product.update_attributes(:code => string2)
      product.product_category.update_attributes(:code => string2)
    end
  end
  
  def self.running_option(product_value, company_name)
    option = ""
    if company_name.present?
      product_value.product_vendors.each do |c|
        if company_name == c.trade_company.name
          option += "<option selected='selected' title='#{c.unit_price}' value='#{c.trade_company.name}'>#{c.trade_company.name}</option>"
        else
          option += "<option                     title='#{c.unit_price}' value='#{c.trade_company.name}'>#{c.trade_company.name}</option>"
        end
      end
    end
    return option
  end
  
  def self.update_id_from_po(desc, prod_id)
    if desc.present?
      pri = PurchaseRequisitionItem.find_all_by_description(desc)
      if pri.present?
        pri.each do |p|
          p.update_attributes!(:product_id => prod_id)
        end
      end
    end
  end
end
