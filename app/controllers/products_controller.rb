class ProductsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :inventory_management_system, :except => [:show]
  layout "sheetbox"
  
  def message
      session[:pri_id]       = params[:pri_id]
      session[:po_desc]      = params[:po_desc]
      session[:po_um_id]     = params[:po_um_id]
      session[:po_up]        = params[:po_up]
      session[:po_vendor_id] = params[:po_vendor_id]
  end
  
  def non_operation
    @categories = ProductCategory.order("code").where("parent_id = ? and category_type = ?", 0, ProductCategory::NON_OPERATION)
    if params[:category_id].present?
      @listing_categories = ProductCategory.find(params[:category_id])
    else
      @listing_categories = nil
    end
#    
  end
  
  def operation
    @categories = ProductCategory.order("code").where("parent_id = ? and category_type = ?", 0, ProductCategory::OPERATION)
    if params[:category_id].present?
      @listing_categories = ProductCategory.find(params[:category_id])
    else
      @listing_categories = nil
    end
#    
  end
  
  def finish_good
    @categories = ProductCategory.order("code").where("parent_id = ? and category_type = ?", 0, ProductCategory::FINISH_GOOD)
    if params[:category_id].present?
      @listing_categories = ProductCategory.find(params[:category_id])
    else
      @listing_categories = nil
    end
#    
  end

  def show
    @product = Product.find(params[:id])
    
    array = @product.sample_action
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: array }
    end
  end

  def new
    @product = Product.new
    @product.product_vendors.build
  end

  def edit
    @product = Product.find(params[:id])
    @unit_measurements = UnitMeasurement.all
    params[:um] = @product.unit_measurement_id
    params[:cutoff_date] = @product.cutoff_date.strftime("%d-%m-%Y") rescue ' '
    @product.product_vendors.build
  end

  def create
    @product = Product.new(params[:product])
    @product_category = ProductCategory.create(:desc => params[:category_description], :parent_id => params[:add_category_id], :icon => ProductCategory::ICON_FILE, :category_type => params[:category_type])
    @product.product_category_id = @product_category.id
    @product.current_stock = @product.opening_stock
    @product.sales_tax_exemption_id = params[:sales_tax_exemption_id]
    
    if @product.save
      Product.run_updating(company, params[:jump], @product, @product_category)
      Product.update_id_from_po(session[:po_desc], @product.id) if session[:pri_id].present?
      InventoryHistory.create(:product_id => @product.id, :stock_in => @product.opening_stock, :stock_out => 0, :inventory_issue_id => 9)
      
      session[:pri_id]       = nil
      session[:po_desc]      = nil
      session[:po_um_id]     = nil
      session[:po_up]        = nil
      session[:po_vendor_id] = nil
      
      redirect_to @product, notice: 'Product ID was successfully created.'
    else
      flash[:alert] = @product.errors.full_messages.join(",")
      render action: "new"
    end
  end

  def update
    @product = Product.find(params[:id])
    
    if @product.update_attributes(params[:product])
        @product.update_attributes(:current_stock => @product.opening_stock)
        if @product.product_category
          @product.product_category.update_attributes(:desc => params[:category_description])
          redirect_to @product, notice: 'Product ID was successfully updated.'
        else
          flash[:alert] = @product.errors.full_messages.join(",")
          render action: "edit"
#          redirect_to "/products?category_id=#{@product.product_category_id}"
        end
    else
      flash[:alert] = @product.errors.full_messages.join(",")
      render action: "edit"
    end
  end
  
  def destroy
    @product = Product.find(params[:id])
    params[:cat_destroy] = @product.product_category.operation if @product.product_category
    @product.destroy
    if params[:cat_destroy] == TRUE
      redirect_to "/products/operation?category_id=#{@product.product_category_id}", notice: 'Delete Successfully'
    else
      redirect_to "/products/non_operation?category_id=#{@product.product_category_id}", notice: 'Delete Successfully'
    end
  end
  
  def new_for_receive_note
    @pri_id = PurchaseRequisitionItem.find(params[:pri_id])
    @product = Product.new
    @type = {'Non Operation' => 0, 'Operation' => 1}
  end
  
  def current_stock
    @product = Product.find(params[:id])
    
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
  
  private
  
  def inventory_management_system
    role(Product::ROLE)
  end
end