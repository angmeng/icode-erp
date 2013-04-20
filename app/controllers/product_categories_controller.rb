class ProductCategoriesController < ApplicationController
  before_filter :authenticate_user!
  layout "sheetbox"
  
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
    err_msg = []
    parent = ProductCategory.find_by_id(params[:parent_id]) if params[:parent_id].present?
    
    if parent.present?
      @new_category = parent.children.new(:code => params[:code], :desc => params[:desc], :parent_id => params[:parent_id], :icon => params[:icon], :category_type => params[:category_type])
    else
      @new_category = ProductCategory.new(:code => params[:code], :desc => params[:desc], :parent_id => params[:parent_id], :icon => params[:icon], :category_type => params[:category_type])
    end
    
    cat, msg = ProductCategory.uniqueness_if_parent_id_is_zero(@new_category.code)
    
    if cat.present? and @new_category.save
      redirect_to @new_category, :notice => 'Group was successfully created.'
    else
      err_msg << msg
      err_msg << @new_category.errors.full_messages
      flash[:alert] = err_msg.join(", ")
      render action: 'parent'
    end
  end
  
  def click_edit_group  # For Edit Group
    @edit_group = ProductCategory.find(params[:id])
  end
  
  def edit_group        # For Update Group
    begin
      @edit_group = ProductCategory.find(params[:id])
      ProductManagement.update_group(@edit_group, params[:code], params[:desc])
      redirect_to @edit_group, notice: 'Editing Group was successfully updated.'
    rescue ActiveRecord::StatementInvalid
      flash[:alert] = "Sorry. Something wrong. Please try again. Thanks."
      render action: 'click_edit_group'
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
    
    if @new_category.save
      ProductManagement.checkbox_field(@new_category, params[:prod_field]) if @new_category.level == 1
      redirect_to @new_category, :notice => 'Sub Group / Product Type was successfully created.'
    else
      flash[:alert] = @new_category.errors.full_messages.join(", ")
      render action: 'new'
    end
  end
    
  def edit              # For Edit Sub Group / Product Type
    @new_category = ProductCategory.find(params[:id])
    @edit_refer_id = @new_category.refer_category_id
    if @new_category.level == 1
      @edit_field_id          = ProductCategory.gather_field_id(@edit_refer_id) if @edit_refer_id.present?
    else
      @edit_field_id_lvl_two  = ProductCategory.gather_field_id(@edit_refer_id) if @edit_refer_id.present?
    end
  end
  
  def update            # For Update Sub Group / Product Type    
    begin
      @new_category = ProductCategory.find(params[:id])
      ProductManagement.update_product_type(@new_category, params[:product_category], params[:active_pid])
      ProductManagement.checkbox_field_edit(@new_category, params[:prod_field]) if @new_category.level == 1
      redirect_to @new_category, notice: 'Editing Sub Group / Product Type was successfully updated.'
    rescue ActiveRecord::StatementInvalid
      flash[:alert] = "Sorry. Something wrong. Please try again. Thanks."
      render action: 'edit'
    end
  end
  
  def common
    @product_category = ProductCategory.find(params[:id])
  end
  
  def update_common
    @product_category = ProductCategory.find(params[:id])
    ProductManagement.updating_common_code(@product_category, params[:common_code])
    redirect_to @product_category, notice: 'Common Code was successfully updated.'
  end
  
  def copy
    @product_category = ProductCategory.find(params[:id])
    ProductManagement.generate_copying(@product_category)
    redirect_to @product_category, notice: 'You were successfully duplicated new Product ID.'
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
      ProductManagement.update_file_kiv(@product_category)
    elsif @product_category.icon == ProductCategory::ICON_FOLDER
      ProductManagement.update_all_kiv(@product_category)
    end
    goto_direction(@product_category)
  end
  
  def delete_data
    @product_category = ProductCategory.find(params[:id])
    ProductManagement.delete_folder(@product_category)  if @product_category.icon == ProductCategory::ICON_FOLDER
    # Please remain below code for delete product id in the future...
#    ProductManagement.delete_folder_and_file(@product_category)
    goto_direction(@product_category)
  end
  
  def delete_product_id
    @product_category = ProductCategory.find(params[:id])
    ProductManagement.delete_folder_and_file(@product_category)
    goto_direction(@product_category)
  end
  
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