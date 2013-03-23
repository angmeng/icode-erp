class ProductCategory < ActiveRecord::Base
#  before_save   :uniqueness_if_parent_id_is_zero
  before_save   :uppercase_text
  before_update :uppercase_text
  validate      :validate_code_length
  
  attr_accessible :code, :desc, :parent_id, :icon, :operation, :more_category, :keep_in_view, :category_type, :status, 
                  :exist_field, :refer_category_id, :level, :open_product_id, :active_common
  
  has_one :product, :dependent => :destroy
  has_one :product_price
  has_one :product_running_number
  
  has_many   :children, :foreign_key => "parent_id", :class_name => "ProductCategory", :order => "code"
  belongs_to :parent,   :foreign_key => "parent_id", :class_name => "ProductCategory"
  
# Dont use :code as presence is true, bcos Product Category will update after make new Product ID.
# Dont use :code, :desc as uniqueness...
  validates :desc, :parent_id, :category_type, :icon, :presence => true
  validates :desc, :length => { :in => 2..255 }
  
  ACTIVE = 'Active'
  KEEP_IN_VIEW = 'KIV'
  
  ICON_FOLDER = 1           # can delete
  ICON_FILE   = 2           # it is running no, can KIV
  ICON_REMOVE_FOLDER = 8   
  ICON_REMOVE_FILE   = 9
  
  NON_OPERATION = 5
  OPERATION     = 6
  FINISH_GOOD   = 7
  
#  ROLE = [
#    InventoryManagementSystem::PRODUCT_CATEGORY_SHOW, 
#    InventoryManagementSystem::PRODUCT_CATEGORY_EDIT,
#    InventoryManagementSystem::PRODUCT_CATEGORY_KIV,
#    InventoryManagementSystem::PRODUCT_CATEGORY_PRINTABLE,
#    InventoryManagementSystem::PRODUCT_CATEGORY_NEW
#  ]
    
  default_scope :order => "code"
  
  scope :db_non_operation,  where("parent_id = ? and category_type = ? and status = ?", 0, ProductCategory::NON_OPERATION, ProductCategory::ACTIVE)
  scope :db_operation,      where("parent_id = ? and category_type = ? and status = ?", 0, ProductCategory::OPERATION, ProductCategory::ACTIVE)
  scope :db_finish_goods,   where("parent_id = ? and category_type = ? and status = ?", 0, ProductCategory::FINISH_GOOD, ProductCategory::ACTIVE)
  
  scope :non_operation_kiv, where("category_type = ? and status = ?", ProductCategory::NON_OPERATION, ProductCategory::KEEP_IN_VIEW)
  scope :operation_kiv,     where("category_type = ? and status = ?", ProductCategory::OPERATION, ProductCategory::KEEP_IN_VIEW)
  scope :finish_goods_kiv,  where("category_type = ? and status = ?", ProductCategory::FINISH_GOOD, ProductCategory::KEEP_IN_VIEW)
  
  SUB_CATEGORY = %w{BOARD FLUTE VARNISH INK BOX LABEL BOOK POSTER}
  
  def uppercase_text
    self.code.upcase! if self.code
    self.desc.upcase! if self.desc
  end
  
  def self.recover_product(pc)
    if pc.present?
      if pc.icon == ProductCategory::ICON_REMOVE_FILE
        pc.update_attributes(:icon => ProductCategory::ICON_FILE, :status => ProductCategory::ACTIVE)
      elsif pc.icon == ProductCategory::ICON_REMOVE_FOLDER
        pc.update_attributes(:icon => ProductCategory::ICON_FOLDER, :status => ProductCategory::ACTIVE)
      end
      if pc.product.present?
        pc.product.update_attributes(:status => Product::ACTIVE)
        pc.product.product_combobox.update_attributes(:status => ProductCombobox::ACTIVE) if pc.product.product_combobox.present?
      end
    end
  end
  
  def self.all_field_id(pc)
    if pc.exist_field == TRUE
      self.gather_field_id(pc.refer_category_id)
    end
  end
  
  def self.gather_field_id(refer_category_id)
    @field = ProductField.find_all_by_category_id(refer_category_id) 
    @field = @field.map(&:field_id) if @field.present?
    return @field
  end
  
  def self.answer_level(category_id)
    pc = ProductCategory.find(category_id)
    pc = pc.level
    return pc
  end
  
  def self.get_data(category_id, no)
    @cat_id = self.find(category_id)
    if @cat_id.present?
      if no == 1
        @cat_id = @cat_id.refer_category_id
      elsif no == 2
        @cat_id = @cat_id.level.to_i + 1
      end
    end
    return @cat_id
  end
  
#  def self.keep_object(new_category, icon, category_type, category_id, refer_id, field_id, level)
#    @new_category = new_category
#    @icon = icon
#    @category_type = category_type
#    @category_id = category_id
#    @refer_id = refer_id
#    @field_id = field_id
#    @level = level
#  end

  def self.uniqueness_if_parent_id_is_zero(code)
    @pc = self.find_by_code_and_parent_id(code, 0)
    if @pc.present?
      return false, "have uniqueness in group" 
    else
      return true
    end
  end
  
  def is_file?
    self.icon == ProductCategory::ICON_FILE
  end
  
  def is_folder?
    self.icon == ProductCategory::ICON_FOLDER
  end
  
  private
    
#  def self.take_child_id(pc)
#    @ret << pc.id
#    
#    if pc.children.present?
#      pc.children.each do |child|
#        self.take_child_id(child) 
#      end
#    end
#    
#    @ret
#  end
  
#  def self.update_ret(ret)
#    @take = ProductCategory.find(ret)
#    @take.each do |r|
#      if r.icon == ProductCategory::ICON_FOLDER
#        r.destroy
#      elsif r.icon == ProductCategory::ICON_FILE
#        r.update_attributes(:status => ProductCategory::KEEP_IN_VIEW, :icon => ProductCategory::ICON_REMOVE_FILE)
#      end
#      if r.product.present?
#        r.product.update_attributes(:status => Product::KEEP_IN_VIEW)
#        r.product.product_combobox.update_attributes(:status => ProductCombobox::KEEP_IN_VIEW) if r.product.product_combobox.present?
#      end
#    end
#  end
  
  def validate_code_length
    if self.icon == ProductCategory::ICON_FOLDER
      errors.add(:code, "should be between 2 and 4 characters") unless self.code.length > 1 && self.code.length < 5
    end
  end
  

end