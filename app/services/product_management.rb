class ProductManagement

  # only available level 0
  def self.checkbox_field(category, prod_field)
    if prod_field.present?
      prod_field.each { |pf| ProductField.create!(:category_id => category.id, :field_id => pf) }
    else
      ProductField.create!(:category_id => category.id, :field_id => ProductField::DESCRIPTION)
    end
    category.update_attributes(:exist_field => TRUE, :refer_category_id => category.id, :level => category.level)
  end
  
  # when edit sub group/product type, only available level 1
  def self.checkbox_field_edit(category, prod_field)
    if prod_field.present?
      @pf = ProductField.where(:category_id => category.refer_category_id)
      @pf.delete_all if @pf.present?
      prod_field.each { |pf| ProductField.create!(:category_id => category.refer_category_id, :field_id => pf) }
    end
  end
  
  def self.manage(product_category_id)
      @manage_product = {}
      @manage_product[:source_name] = Product.joining_category(product_category_id)
      @manage_product[:source_desc] = Product.joining_category_description(product_category_id)
      self.base_and_sub_name(product_category_id)
      return @manage_product
  end
  
  def self.base_and_sub_name(cat_id)
    @category = ProductCategory.find(cat_id)
    @manage_product[:base_name]   = Product.parent_name_when_parent_id_is_zero(@category, false)
    @manage_product[:sub_name]    = @category.code
    @manage_product[:running_no]  = ProductRunningNumber.find_by_base_name_and_sub_name(@manage_product[:base_name], @manage_product[:sub_name]) if @manage_product[:base_name].present? && @manage_product[:sub_name].present?
  end

  def self.manage_product_category(category_name, add_category_id, category_type, product, packing_method_qty, packing_method_per, jump)
      @manage_product = {}
      @add_category_id = add_category_id
    
      ProductCategory.transaction do 
        Product.transaction do
          ProductRunningNumber.transaction do
            ProductCombobox.transaction do
              InventoryHistory.transaction do
                @product_category = ProductCategory.new(:desc => category_name, :parent_id => add_category_id, :icon => ProductCategory::ICON_FILE, :category_type => category_type, :exist_field => true, :refer_category_id => ProductCategory.get_data(add_category_id, 1), :level => ProductCategory.get_data(add_category_id, 2))
                @product_category.save!

                @product = Product.new(product)
                @product.product_category_id = @product_category.id
                @product.save!

                self.updating_running_no(jump)
                
                Product.packing_method_line(packing_method_qty, packing_method_per, @product) if packing_method_qty.present? && packing_method_per.present?
              end
            end
          end
        end
      end
      
      return @product
  end
  
  def self.updating_running_no(jump)
    self.base_and_sub_name(@add_category_id)
    if @manage_product[:running_no].present?
      b = (jump == "yes") ? @manage_product[:running_no].running_no + 2 : @manage_product[:running_no].running_no + 1
      @product_running_no = ProductRunningNumber.find_by_id(@manage_product[:running_no].id)
      @product_running_no.update_attributes!(:running_no => b)
    else
      b = (jump == "yes") ? 2 : 1
      @prn = ProductRunningNumber.new(:base_name => @manage_product[:base_name], :sub_name => @manage_product[:sub_name], :running_no => b)
      @prn.save!
    end
    string = "%05d" % b
    @product_category.update_attributes!(:code => string)
    @product.update_attributes!(:code => string)
    @combo = ProductCombobox.new(:product_code => Product.category(@product), :product_id => @product.id, :category_type => @product.product_category.category_type)
    @combo.save!
    @inventory = @product.inventory_histories.new(:stock_in => @product.opening_stock, :stock_out => 0, :inventory_issue_id => InventoryIssue::NEW_PRODUCT)
    @inventory.save!
  end
  
  # need to test first..
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
  
  def self.add_product_vendor(product, po_up, po_vendor_id)
    product.product_vendors.create!(:trade_company_id => po_vendor_id, :unit_price => po_up)
  end
  
end