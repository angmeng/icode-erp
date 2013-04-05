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
  
  def self.base_and_sub_name(cat_id)
    @category                     = ProductCategory.find(cat_id)
    self.parent_code_when_parent_id_is_zero(@category, false)
    @manage_product[:sub_name]    = @category.code
    @manage_product[:running_no]  = ProductRunningNumber.find_by_base_name_and_sub_name(@manage_product[:base_name], @manage_product[:sub_name]) if @manage_product[:base_name].present? && @manage_product[:sub_name].present?
  end
  
  def self.base_and_sub_name_when_exist_product_id(cat_id)
    @category                     = ProductCategory.find(cat_id)
    self.parent_code_when_parent_id_is_zero(@category, false)
    @manage_product[:sub_name]    = @category.parent.code
  end
  
  def self.manage(product_category_id)
      @manage_product               = {}
      @manage_product[:source_name] = Product.joining_category(product_category_id)
      @manage_product[:source_desc] = Product.joining_category_description(product_category_id)
      self.base_and_sub_name(product_category_id)
      return @manage_product
  end

  def self.manage_product_category(category_name, add_category_id, category_type, product, packing_method_qty, packing_method_per, jump)
      @manage_product   = {}
      @add_category_id  = add_category_id
      ProductCategory.transaction do 
        Product.transaction do
          ProductRunningNumber.transaction do
            ProductCombobox.transaction do
              InventoryHistory.transaction do
                @product_category = ProductCategory.new(:desc => category_name, :parent_id => add_category_id, :icon => ProductCategory::ICON_FILE, :category_type => category_type, :exist_field => true, :refer_category_id => ProductCategory.get_data(add_category_id, 1), :level => ProductCategory.get_data(add_category_id, 2))
                @product_category.save!
                @product_category.parent.update_attributes!(:open_product_id => true)
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
      @product_running_no.update_attributes!(:running_no => b, :product_category_id => @add_category_id)
    else
      b = (jump == "yes") ? 2 : 1
      @prn = ProductRunningNumber.new(:base_name => @manage_product[:base_name], :sub_name => @manage_product[:sub_name], :running_no => b, :product_category_id => @add_category_id)
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
#    product.product_vendors.create!(:trade_company_id => po_vendor_id, :unit_price => po_up)
    ProductVendor.create!(:trade_company_id => po_vendor_id, :unit_price => po_up)
  end
  
#  Group Start
  def self.update_group(pc, code, desc)
    @ret = []
    self.take_child_id(pc) if pc.children.present?
    if @ret.present?
      self.ready_updating_for_group(@ret, pc, code, desc) 
    else
      pc.update_attributes!(:code => code, :desc => desc)
    end
  end
  
  def self.ready_updating_for_group(ret, pc, code, desc)
    count               = 0
    @ret                = ret
    @ori_base_name      = pc.code
    
    ProductRunningNumber.transaction do 
      ProductCategory.transaction do
        ProductCombobox.transaction do
          @ret.each do |rt|
            take_file = ProductCategory.find(rt)
            if take_file.present?
              if take_file.is_file?
                prod          = take_file.product
                ori_sub_name  = take_file.parent.code
                @prn = ProductRunningNumber.find_by_base_name_and_sub_name(@ori_base_name, ori_sub_name)
                @prn.update_attribute( :base_name, code ) if @prn.present?
                pc.update_attributes!(:code => code, :desc => desc)
                prod.product_combobox.update_attributes!(:old_product_code => prod.product_combobox.product_code, :product_code => Product.category(prod)) if prod.product_combobox.present?
                count += 1
              end
            end
          end          
        end
      end
    end    
    pc.update_attributes!(:code => code, :desc => desc) if count == 0
  end
#  Group End
#    
#  Product Type Start
  def self.update_product_type(pc, product_category_data, active_pid)
    @ret = []
    self.take_child_id(pc) if pc.children.present?
    if @ret.present?
      self.ready_updating_for_product_type(@ret, pc, product_category_data, active_pid)
    else
      pc.update_attributes!(product_category_data)
    end
  end
  
  def self.ready_updating_for_product_type(ret, pc, product_category_data, active_pid)
    count               = 0
    @ret                = ret
    @manage_product     = {}
    ProductRunningNumber.transaction do 
      ProductCategory.transaction do
        ProductCombobox.transaction do
          @ret.each do |rt|
            take_file = ProductCategory.find(rt)
            if take_file.present?
              if take_file.is_file?
                self.base_and_sub_name_when_exist_product_id(take_file)
                prod = take_file.product
                @prn = ProductRunningNumber.find_by_base_name_and_sub_name(@manage_product[:base_name], @manage_product[:sub_name])
                if @prn.present? 
                  @prn.update_attribute(:sub_name, product_category_data[:code]) if active_pid == "yes"
                end
                pc.update_attributes!(product_category_data)
                prod.product_combobox.update_attributes!(:old_product_code => prod.product_combobox.product_code, :product_code => Product.category(prod)) if prod.product_combobox.present?
                count += 1
              end
            end
          end
        end
      end
    end
    pc.update_attributes!(product_category_data) if count == 0
  end
#  Product Type End
  
  def self.updating_common_code(product_category, common_code)
    ProductCategory.transaction do
      ProductCombobox.transaction do
        Product.transaction do
          if product_category.parent.present?
            new_product_category = product_category.parent.dup
            new_product_category.code = common_code
            new_product_category.save!
            product_category.update_attributes!(:parent_id => new_product_category.id, :active_common => true) 
          end
          
          if product_category.product.present?
            prod = product_category.product
            prod.product_combobox.update_attributes!(:old_product_code => prod.product_combobox.product_code, :product_code => Product.category(prod)) if prod.product_combobox.present?
          end
        end
      end
    end
  end
  
  # Product - Delete Module
  def self.delete_folder(pc)
    @ret = []
    pc.children.present? ? self.take_child_id(pc) : pc.destroy
  end
  
  #Don't delete, it is useful in the future.. 8/3/2013
#  def self.delete_folder_and_file(pc)
#    @ret = []
#    pc.children.present? ? self.take_child_id(pc) : pc.destroy
#    self.ready_delete(@ret) if @ret.present?
#  end

#  def self.ready_delete(ret)
#    @manage_product = {}
#    @ret = ret
#    @ret.each do |rt|
#      take_file    = ProductCategory.find(rt)
#      if take_file.present?
#        if take_file.is_file?
#          self.base_and_sub_name(take_file)
#          prod = take_file.product
#          pri  = PurchaseRequisitionItem.find_all_by_product_id(prod.id)
#          inv  = InventoryHistory.find_all_by_product_id(prod.id)
#          prod.product_vendors.delete_all             if prod.product_vendors.present?
#          prod.purchase_requisition_items.delete_all  if pri.present?
#          prod.packing_quantities.delete_all          if prod.packing_quantities.present?
#          prod.inventory_histories.delete_all         if inv.present?
#          prod.product_combobox.destroy               if prod.product_combobox.present?
#          @manage_product[:running_no].destroy        if @manage_product[:running_no].present?
#          prod.destroy                                if prod.present?
#          take_file.destroy                           if take_file.present?
#        end
#      end
#    end
#  end
  
  def self.update_all_kiv(pc)
    @ret = []
    pc.children.present? ? self.take_child_id(pc) : pc.update_attributes(:status => ProductCategory::KEEP_IN_VIEW, :icon => ProductCategory::ICON_REMOVE_FOLDER)
    self.update_ret(@ret) if @ret.present?
  end
  
  def self.update_file_kiv(pc)
    if pc.present?
      pc.update_attributes(:status => ProductCategory::KEEP_IN_VIEW, :icon => ProductCategory::ICON_REMOVE_FILE)
      if pc.product.present?
        pc.product.update_attributes(:status => Product::KEEP_IN_VIEW)
        pc.product.product_combobox.update_attributes(:status => ProductCombobox::KEEP_IN_VIEW) if pc.product.product_combobox.present?
      end
    end
  end
  
  private
  
  def self.take_child_id(pc)
    @ret << pc.id
    if pc.children.present?
      pc.children.each do |child|
        self.take_child_id(child) 
      end
    end
    @ret
  end
  
  def self.update_ret(ret)
    @take = ProductCategory.find(ret)
    @take.each do |r|
      if r.icon == ProductCategory::ICON_FOLDER
        r.update_attributes(:status => ProductCategory::KEEP_IN_VIEW, :icon => ProductCategory::ICON_REMOVE_FOLDER)
      elsif r.icon == ProductCategory::ICON_FILE
        r.update_attributes(:status => ProductCategory::KEEP_IN_VIEW, :icon => ProductCategory::ICON_REMOVE_FILE)
      end
      if r.product.present?
        r.product.update_attributes(:status => Product::KEEP_IN_VIEW)
        r.product.product_combobox.update_attributes(:status => ProductCombobox::KEEP_IN_VIEW) if r.product.product_combobox.present?
      end
    end
  end
  
  def self.parent_code_when_parent_id_is_zero(category, view)
      ret = []
      view ? ret << view : ret = []
      parents = category.parent

      if parents.parent_id == 0
        @manage_product[:base_name] = parents.code
      else
        ret << parents.code
        ret.flatten!
        self.parent_code_when_parent_id_is_zero(parents, ret)
      end
      return @manage_product[:base_name]
  end
  
end