class ProductCombobox < ActiveRecord::Base
  attr_accessible :product_code, :product_id, :category_type, :status
  
  ACTIVE = "Active"
  KEEP_IN_VIEW = "KIV"
  
  has_one :stock_out
  belongs_to :product
  
  validates :product_code, :uniqueness => true
  
  scope :fg_active ,where(:category_type => ProductCategory::FINISH_GOOD, :status => ProductCombobox::ACTIVE)
  scope :category, where(:category_type => ProductCategory::FINISH_GOOD)
  scope :db_active, where(:status => ProductCombobox::ACTIVE)
  scope :db_active_both_operation, where("status = ?", ProductCombobox::ACTIVE).where("category_type =? or category_type = ?", ProductCategory::NON_OPERATION, ProductCategory::OPERATION)
  scope :db_active_finish_goods,   where("status = ?", ProductCombobox::ACTIVE).where(:category_type => ProductCategory::FINISH_GOOD)
  
  def self.finish_goods
    category.db_active
  end
  
  def self.put_description(product_combobox)
    desc = []
    product_combobox.each do |pcombo|
      desc << { :product_id => pcombo.product_id, :description => pcombo.product.desc }
    end
    return desc
  end
  
  def self.pr_comboboxes
    combobox = self.db_active_both_operation
    mix = combobox.collect { |pcombo| ["[#{pcombo.product_code}] #{pcombo.product.desc.gsub(/\n/, ' ')}", pcombo.product_id] }
    return mix
  end
  
  def self.qr_comboboxes
    combobox = self.db_active_finish_goods
    mix = combobox.collect { |pcombo| ["[#{pcombo.product_code}] #{pcombo.product.desc.gsub(/\n/, ' ')}", pcombo.product_id] }
    return mix
  end
end
