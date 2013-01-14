class Product < ActiveRecord::Base
  before_save :uppercase_text
  before_update :uppercase_text
  
  attr_accessible :code, :color_grade, :opening_stock, :current_stock, :cutoff_date, :desc, :model,  :part_no, :part_weight, :selling_price, :tarif_code, :unit_measurement_id, :version, :product_category_id, :product_vendors_attributes, :product_name, :unit_price, :sales_tax_exemption_id, :quotation_request_form_id, :effective_date,
                  :product_type, :gsm, :width, :width_um, :length, :length_um, :height, :height_um, :tickness, :tickness_um, :origin, :brand, :grade,
                  :packing_method, :packing_qty, :container_no, :seal_no, :despatch_advise,
                  :size, :model_no, :reorder_no, :art_no, :ref_no, :work_order_no, :mfg_date, :exp_date, :film_no, :bar_code,
                  :item_code, :part_code, :pantone_code, :color, :serial_no, :warranty, :capacity, :diameter,
                  :voltage, :watt, :pin, :ampere, :hp, :hz, :pureness, :ton, :consignee, :destination, :process, :status, :buffer_stock, :lot_no, :mould_no,
                  :sales_tax_exemption_barang_id
  
  belongs_to :product_category
  belongs_to :unit_measurement
  belongs_to :sales_tax_exemption
  belongs_to :quotation_request_form
  belongs_to :sales_tax_exemption_barang
  
  has_one    :purchase_requisition
  has_one    :sales_order_item
  has_one    :product_combobox
  has_one    :product_customer
  
  has_many   :price_control_items, :dependent => :destroy
  has_many   :purchase_requisition_items
  has_many   :inventory_histories, :dependent => :destroy
  has_many   :sales_tax_exemption_items, :dependent => :destroy
  has_many   :packing_quantities, :dependent => :destroy
  
  has_many :product_vendors, :dependent => :destroy
  accepts_nested_attributes_for :product_vendors, :reject_if => lambda { |a| a[:trade_company_id].blank? }, :allow_destroy => true
  
  validates :product_category_id, :presence => true
  validates :part_no, :tarif_code, :length => { :maximum => 40 }
  validates :desc, :uniqueness => true
  validates :desc, :length => { :maximum => 255 }
  
  ACTIVE = "Active"
  KEEP_IN_VIEW = "KIV"
  
  COMBO_UM = %w{ cm m mm micron inch}
  
  ROLE = [
    InventoryManagementSystem::PRODUCT_MENU,
    InventoryManagementSystem::PRODUCT_NON_OPERATION,
    InventoryManagementSystem::KIV_PRODUCT_NON_OPERATION,
    InventoryManagementSystem::PRODUCT_OPERATION,
    InventoryManagementSystem::KIV_PRODUCT_OPERATION,
    InventoryManagementSystem::PRODUCT_FINISH_GOOD,
    InventoryManagementSystem::KIV_PRODUCT_FINISH_GOOD,
    InventoryManagementSystem::PRODUCT_NON_OPERATION_GROUP,
    InventoryManagementSystem::PRODUCT_NON_OPERATION_SUB_GROUP,
    InventoryManagementSystem::PRODUCT_NON_OPERATION_SUB_GROUP_EDIT,
    InventoryManagementSystem::PRODUCT_NON_OPERATION_FILE,
    InventoryManagementSystem::PRODUCT_NON_OPERATION_FILE_EDIT,
    InventoryManagementSystem::PRODUCT_NON_OPERATION_KIV,
    InventoryManagementSystem::PRODUCT_NON_OPERATION_RECOVER,
    InventoryManagementSystem::PRODUCT_OPERATION_GROUP,
    InventoryManagementSystem::PRODUCT_OPERATION_SUB_GROUP,
    InventoryManagementSystem::PRODUCT_OPERATION_SUB_GROUP_EDIT,
    InventoryManagementSystem::PRODUCT_OPERATION_FILE,
    InventoryManagementSystem::PRODUCT_OPERATION_FILE_EDIT,
    InventoryManagementSystem::PRODUCT_OPERATION_KIV,
    InventoryManagementSystem::PRODUCT_OPERATION_RECOVER,
    InventoryManagementSystem::PRODUCT_FINISH_GOOD_GROUP,
    InventoryManagementSystem::PRODUCT_FINISH_GOOD_SUB_GROUP,
    InventoryManagementSystem::PRODUCT_FINISH_GOOD_SUB_GROUP_EDIT,
    InventoryManagementSystem::PRODUCT_FINISH_GOOD_FILE,
    InventoryManagementSystem::PRODUCT_FINISH_GOOD_FILE_EDIT,
    InventoryManagementSystem::PRODUCT_FINISH_GOOD_KIV,
    InventoryManagementSystem::PRODUCT_FINISH_GOOD_RECOVER
  ]
    
  def uppercase_text
    if self.desc.present?
      self.desc.upcase! 
      self.desc.strip!
    end
    self.part_no.upcase! if self.part_no.present?
    self.tarif_code.upcase! if self.tarif_code.present?
    self.origin.upcase! if self.origin.present?
    self.brand.upcase! if self.brand.present?
    self.grade.upcase! if self.grade.present?
    self.packing_method.upcase! if self.packing_method.present?
    self.container_no.upcase! if self.container_no.present?
    self.seal_no.upcase! if self.seal_no.present?
    self.despatch_advise.upcase! if self.despatch_advise.present?
    self.size.upcase! if self.size.present?
    self.model_no.upcase! if self.model_no.present?
    self.reorder_no.upcase! if self.reorder_no.present?
    self.art_no.upcase! if self.art_no.present?
    self.ref_no.upcase! if self.ref_no.present?
    self.work_order_no.upcase! if self.work_order_no.present?
    self.film_no.upcase! if self.film_no.present?
    self.bar_code.upcase! if self.bar_code.present?
    self.lot_no.upcase! if self.lot_no.present?
    self.item_code.upcase! if self.item_code.present?
    self.part_code.upcase! if self.part_code.present?
    self.pantone_code.upcase! if self.pantone_code.present?
    self.color.upcase! if self.color.present?
    self.serial_no.upcase! if self.serial_no.present?
    self.warranty.upcase! if self.warranty.present?
    self.capacity.upcase! if self.capacity.present?
    self.consignee.upcase! if self.consignee.present?
    self.destination.upcase! if self.destination.present?
    self.process.upcase! if self.process.present?
    self.mould_no.upcase! if self.mould_no.present?
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
  
  def self.json_um(product)
    a = { :id => product.id, :desc => product.desc, :um => product.unit_measurement.code }
    return a
  end
  
  def self.run_updating(comp, jump, product)
    a = comp.sn_product_id_no
    if jump == "yes"
      b = a + 2
      string = "%05d" % (b)
    else
      b = a + 1
      string = "%05d" % (b)
    end
    
    if comp.update_attributes(:sn_product_id_no => b)
      if product.update_attributes(:code => string)
        if product.product_category.update_attributes(:code => string)
          @combo = ProductCombobox.new(:product_code => self.category(product), :product_id => product.id, :category_type => product.product_category.category_type)
          if @combo.save
            return true
          else
            comp.update_attributes(:sn_product_id_no => a)
            return false, @combo.errors.full_messages.join(", ")
          end
        else
          comp.update_attributes(:sn_product_id_no => a)
          return false, product.errors.full_messages.join(", ")
        end
      else
        comp.update_attributes(:sn_product_id_no => a)
        return false, product.errors.full_messages.join(", ")
      end
    else
      return false, comp.errors.full_messages.join(", ")
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
  
  def self.joining_category(cat_id)
    @category = ProductCategory.find(cat_id)
    joining = []
    joining = self.product_join(@category, false)
    joining << @category.code
    return joining.join('-')
  end
  
  def self.joining_category_description(cat_id)
    @category = ProductCategory.find(cat_id)
    joining = []
    joining = self.product_join_category_description(@category, false)
    joining << @category.desc
    return joining.join('-')
  end
  
  def self.packing_method_line(qty, per, product)
    product.packing_quantities.delete_all if product.packing_quantities.present?
    qty.each do |k1, v1|
      per.each do |k2, v2|
        product.packing_quantities.create(:quantity => v1[:val], :packing_type => v2[:val]) if k1 == k2
      end
    end
  end
  
  def self.add_product_vendor(product, po_up, po_vendor_id)
    product.product_vendors.create(:trade_company_id => po_vendor_id, :unit_price => po_up)
  end
  
  def self.matching_tarif_code(tarif_code)
    if find_tcode = SalesTaxExemptionBarang.find_by_tarif_code_and_valid_condition(tarif_code, TRUE)
      return true
    else
      return false, "Sales Tax Exemption can't matching with Tarif Code."
    end
  end
  
  def self.get_info(product)
    a = { :id => product.id, :desc => product.desc, :um => product.unit_measurement.code }
    return a
  end
  
  private
  
  def self.category(pc)
    if pc.present?
      if pc.product_category.present?
        prod_code = [] 
        prod_code << self.product_join(pc.product_category, false)
        prod_code << pc.product_category.code
        return prod_code.join("-") 
      end 
    end
  end
    
  def self.product_join(category, view)
      ret = []
      view ? ret << view : ret = []
      parents = category.parent

      if parents.parent_id == 0
        ret << parents.code
        ret.flatten!
        ret.reverse
      else
        ret << parents.code
        ret.flatten!
        self.product_join(parents, ret)
      end
  end
  
  def self.product_join_category_description(category, view)
      ret = []
      view ? ret << view : ret = []
      parents = category.parent

      if parents.parent_id == 0
        ret << parents.desc
        ret.flatten!
        ret.reverse
      else
        ret << parents.desc
        ret.flatten!
        self.product_join_category_description(parents, ret)
      end
  end
end
