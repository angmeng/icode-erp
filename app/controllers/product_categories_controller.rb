class ProductCategoriesController < ApplicationController
  before_filter :authenticate_user!
  layout "sheetbox"
  
  def index
  end
  
  def non_operation
    @categories = ProductCategory.db_non_operation
  end
  
  def operation
    @categories = ProductCategory.db_operation
  end
  
  def finish_good
    @categories = ProductCategory.finish_goods
  end
  
  def show
    @product_category = ProductCategory.find(params[:id])
    
    @refer_id = @product_category.refer_category_id
    @field_id = ProductCategory.gather_field_id(@refer_id) if @refer_id.present?
  end
  
  def parent            # For Group
    @new_category = ProductCategory.new
    @icon = ProductCategory::ICON_FOLDER
    @category_type = params[:category_type]
  end
  
  def add_group         # For Create Group
    parent = ProductCategory.find_by_id(params[:parent_id]) if params[:parent_id].present?
    
    if parent.present?
      @new_category = parent.children.new(:code => params[:code], :desc => params[:desc], :parent_id => params[:parent_id], :icon => params[:icon], :category_type => params[:category_type])
    else
      @new_category = ProductCategory.new(:code => params[:code], :desc => params[:desc], :parent_id => params[:parent_id], :icon => params[:icon], :category_type => params[:category_type])
    end
    
    respond_to do |format|
      if @new_category.save
        format.html { redirect_to @new_category, :notice => 'Group was successfully created.' }
        format.js   { render js: "window.location.pathname='#{product_category_path(@new_category)}'" }
      else
        format.html { render action: 'parent' }
        format.js   { render js: "alert('#{@new_category.errors.full_messages.join(", ")}');" }
      end
    end
  end
  
  def click_edit_group  # For Edit Group
    @edit_group = ProductCategory.find(params[:id])
  end
  
  def edit_group        # For Update Group
    @edit_group = ProductCategory.find(params[:id])

    respond_to do |format|
      if @edit_group.update_attributes(:code => params[:code], :desc => params[:desc])
        format.html { redirect_to @edit_group, notice: 'Editing Group was successfully updated.' }
        format.js   { render js: "window.location.pathname='#{product_category_path(@edit_group)}'" }
      else
        format.html { render action: 'click_edit_group' }
        format.js   { render js: "alert('#{@edit_group.errors.full_messages.join(", ")}');" }
      end
    end
  end
  
  def new               # For Sub Group / Product Type
    @new_category = ProductCategory.new
    @icon = ProductCategory::ICON_FOLDER
    @category_type = params[:category_type]
    @category_id   = params[:parent_id]
    @refer_id      = params[:refer_category_id]
  end

  def create            # For Create Sub Group / Product Type
    parent = ProductCategory.find_by_id(params[:product_category][:parent_id]) if params[:product_category][:parent_id].present?
    
    if parent.present?
      @new_category = parent.children.new(params[:product_category])
    else
      @new_category = ProductCategory.new(params[:product_category])
    end
    
    respond_to do |format|
      if @new_category.save
#        ProductField.checkbox_field(@new_category, params[:prod_field]) if @new_category.level == 1
        ProductManagement.checkbox_field(@new_category, params[:prod_field]) if @new_category.level == 1
        format.html { redirect_to @new_category, :notice => 'Sub Group/Product Type was successfully created.' } 
        format.js   { render js: "window.location.pathname='#{product_category_path(@new_category)}'" }
      else
        format.html { render action: 'new' }
        format.js   { render js: "alert('#{@new_category.errors.full_messages.join(", ")}');" }
      end
    end
  end
    
  def edit              # For Edit Sub Group / Product Type
    @new_category = ProductCategory.find(params[:id])
    @edit_refer_id = @new_category.refer_category_id
    
    if @new_category.level == 1
      @edit_field_id = ProductCategory.gather_field_id(@edit_refer_id) if @edit_refer_id.present?
    else
      @edit_field_id_lvl_two = ProductCategory.gather_field_id(@edit_refer_id) if @edit_refer_id.present?
    end
  end
  
  def update            # For Update Sub Group / Product Type
    @new_category = ProductCategory.find(params[:id])

    respond_to do |format|      
      if @new_category.update_attributes(params[:product_category])
#        ProductField.checkbox_field_edit(@new_category, params[:prod_field]) if @new_category.level == 1
        ProductManagement.checkbox_field_edit(@new_category, params[:prod_field]) if @new_category.level == 1
        format.html { redirect_to @new_category, notice: 'Editing Sub Group/Product Type was successfully updated.' }
        format.js   { render js: "window.location.pathname='#{product_category_path(@new_category)}'" }
      else
        format.html { render action: 'edit' }
        format.js   { render js: "alert('#{@new_category.errors.full_messages.join(", ")}');" }
      end
    end
  end
  
  #new folder is ok
  def new_folder
    @category = ProductCategory.new(params[:product_category])
    if @category.save
      flash[:notice] = 'Product category was successfully created.'
      goto_direction(@category)
    else
      flash[:alert] = @category.errors.full_messages.join(",")
      goto_direction(@category)
    end
  end
  
  def destroy
    @product_category = ProductCategory.find(params[:id])
    if @product_category.icon == ProductCategory::ICON_FILE
      ProductCategory.update_file_kiv(@product_category)
    elsif @product_category.icon == ProductCategory::ICON_FOLDER
      ProductCategory.update_all_kiv(@product_category)
    end
    goto_direction(@product_category)
  end
  
#  def edit_window
#    @category = ProductCategory.find(params[:parent_id])
#    params[:code] = @category.code if params[:code].empty?
#    params[:desc] = @category.desc if params[:desc].empty?
#    if @category.update_attributes(:code => params[:code], :desc => params[:desc])
#      flash[:notice] = 'Product category was successfully created.'
#      goto_direction(@category)
#    else
#      flash[:alert] = @category.errors.full_messages.join(",")
#      goto_direction(@category)
#    end
#  end
  
  def remove
    @product_category = ProductCategory.find(params[:id])
    @product_category.update_attributes(:icon => 3, :keep_in_view => TRUE)
    goto_direction(@product_category)
  end
  
  def recover
    @product_category = ProductCategory.find(params[:id])
    ProductCategory.recover_product(@product_category)
    goto_direction_kiv(@product_category)
  end
  
  private
#  def inventory_management_system
#    role(ProductCategory::ROLE)
#  end
end