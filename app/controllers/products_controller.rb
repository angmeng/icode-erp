class ProductsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :inventory_management_system, :except => [:show]
  layout "sheetbox"
  
  def message
    if params[:pri_id].present?
      pri = PurchaseRequisitionItem.find(params[:pri_id])
      session[:pri_id]       = pri.id
      session[:po_desc]      = pri.description
      session[:po_um_id]     = pri.unit_measurement_id
      session[:po_up]        = pri.unit_price
      session[:po_vendor_id] = pri.trade_company_id
    end
  end
  
  def non_operation
    @categories = ProductCategory.db_non_operation
    manage_categories(params[:category_id])
  end
  
  def non_operation_info
    non_operation
    render :layout => false
  end
  
  def operation
    @categories = ProductCategory.db_operation
    manage_categories(params[:category_id])
  end
  
  def operation_info
    operation
    render :layout => false
  end
  
  def finish_good
    @categories = ProductCategory.db_finish_goods
    manage_categories(params[:category_id])
  end
  
  def finish_good_info
    finish_good
    render :layout => false
  end
  
  def kiv_non_operation
    @categories = ProductCategory.non_operation_kiv
    manage_categories(params[:category_id])
  end
  
  def kiv_non_operation_info
    kiv_non_operation
    render :layout => false
  end
  
  def kiv_operation
    @categories = ProductCategory.operation_kiv
    manage_categories(params[:category_id])
  end
  
  def kiv_operation_info
    kiv_operation
    render :layout => false
  end
  
  def kiv_finish_good
    @categories = ProductCategory.finish_goods_kiv
    manage_categories(params[:category_id])
  end
  
  def kiv_finish_good_info
    kiv_finish_good
    render :layout => false
  end

  
  
  
  
  def show
    @product = Product.find(params[:id])
    arr_prod = Product.json_um(@product)
    manage_categories(@product.product_category.id) if @product.product_category.present?
    
    respond_to do |format|
      format.html
      format.json { render json: arr_prod }
    end
  end
  
  def new
    @product          = Product.new
    @manage_product   = ProductManagement.manage(params[:add_category_id]) if params[:add_category_id].present?
    manage_categories(params[:refer_category_id])
#    session[:refer_category_id] = params[:refer_category_id]
  end
  
  def create
    begin
      @product = ProductManagement.manage_product_category(params[:category_name], params[:add_category_id], params[:category_type], params[:product], params[:packing_method_qty], params[:packing_method_per], params[:jump])
      # business transaction (start)
      ProductManagement.update_id_from_po(session[:po_desc], @product.id) if session[:pri_id].present?
      ProductManagement.add_product_vendor(@product, session[:po_up], session[:po_vendor_id]) if session[:po_up].present? and session[:po_vendor_id].present?
      # business transaction (end)
      clearing_function
      if params[:save_and_new]
        redirect_to new_product_path(:add_category_id => params[:add_category_id], :category_type => params[:category_type], :refer_category_id => params[:refer_category_id]), notice: "Product ID # #{@product.product_combobox.product_code} was successfully created."
      else
        redirect_to @product, notice: "Product ID # #{@product.product_combobox.product_code} was successfully created."
      end
    rescue ActiveRecord::StatementInvalid
      new
      flash[:alert] = "Sorry. The process has failed. Please try again. Thanks."
      render :action => "new"
    end
  end
  
  def edit
    @product = Product.find(params[:id])
    manage_categories(@product.product_category.refer_category_id) if @product.present?
  end

  def update
    @product = Product.find(params[:id])
    
    if @product.update_attributes(params[:product])
      Product.packing_method_line(params[:packing_method_qty], params[:packing_method_per], @product) if params[:packing_method_qty].present?
      @product.product_category.update_attributes(:desc => params[:category_name]) if @product.product_category.present?
      redirect_to @product, notice: 'Product ID was successfully updated.'
    else
      flash[:alert] = @product.errors.full_messages.join(",")
      render action: "edit"
    end
  end
  
  def new_for_receive_note
    @pri_id = PurchaseRequisitionItem.find(params[:pri_id])
    @product = Product.new
    @type = {'Non Operation' => 0, 'Operation' => 1}
  end
  
  def current_stock
    @product = Product.find(params[:id])
    @product[:um] = @product.unit_measurement.code if @product.unit_measurement.present?
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end
  
  def loading_product_id
    @product = Product.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end
  
  def look_product_desc
    @product = Product.find_by_desc(params[:desc])
    arr_prod = Product.get_info(@product)
    respond_to do |format|
      format.html
      format.json { render json: arr_prod }
    end
  end
  
  private
  
  def inventory_management_system
    role(Product::ROLE)
  end
  
  def manage_categories(cat_id)
    @category_id        = cat_id
    @listing_categories = ProductCategory.find(@category_id)                if @category_id.present?
    @field_id           = ProductCategory.all_field_id(@listing_categories) if @listing_categories.present?
    @show_product       = @listing_categories.product                       if @listing_categories.present?
  end
  
  def sub_name(cat_id)
    @category_id = cat_id
    @sub_name = ProductCategory.find(@category_id).code if @category_id.present?
  end
  
  def clearing_function
    session[:pri_id]            = nil #ok
    session[:po_desc]           = nil #ok
    session[:po_um_id]          = nil #ok
    session[:po_up]             = nil #ok
    session[:po_vendor_id]      = nil #ok
    session[:qr_id]             = nil
  end
end