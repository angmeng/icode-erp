class PriceControlItemsController < ApplicationController
  before_filter :authenticate_user!
  layout "sheetbox"
  
  # GET /price_control_items
  # GET /price_control_items.json
  def index
    @price_control_items = PriceControlItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @price_control_items }
    end
  end

  # GET /price_control_items/1
  # GET /price_control_items/1.json
  def show
    @price_control_item = PriceControlItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @price_control_item }
    end
  end

  # GET /price_control_items/new
  # GET /price_control_items/new.json
  def new
    @price_control_item = PriceControlItem.new
#    @product_customer = ProductCustomer.fg_combobox(params[:company_id]) if params[:company_id].present?
#    session[:company_id] = params[:company_id]
  end

  # GET /price_control_items/1/edit
  def edit
    @price_control_item = PriceControlItem.find(params[:id])
#    if @price_control_item.product.present?
#      if @price_control_item.product.product_customer.present?
#        session[:company_id] = @price_control_item.product.product_customer.trade_company.id
#        @product_customer = ProductCustomer.fg_combobox(session[:company_id])
#      end
#    end
  end

  # POST /price_control_items
  # POST /price_control_items.json
  def create
    @price_control_item = PriceControlItem.new(params[:price_control_item])

    if @price_control_item.save
      redirect_to @price_control_item, notice: 'Price control item was successfully created.'
    else
      flash[:alert] = @price_control_item.errors.full_messages.join(', ')
      render action: "new" 
    end
  end

  # PUT /price_control_items/1
  # PUT /price_control_items/1.json
  def update
    @price_control_item = PriceControlItem.find(params[:id])

    if @price_control_item.update_attributes(params[:price_control_item])
#      @price_control_item.product.update_attributes!(:selling_price => @price_control_item.new_unit_price, :effective_date => @price_control_item.new_eff_date)
#      session[:company_id] = nil
      redirect_to @price_control_item, notice: 'Price control item was successfully updated.'
    else
      flash[:alert] = @price_control_item.errors.full_messages.join(', ')
      render action: "edit"
    end
  end

  # DELETE /price_control_items/1
  # DELETE /price_control_items/1.json
  def destroy
    @price_control_item = PriceControlItem.find(params[:id])
    if @price_control_item.update_attributes(:status => PriceControlItem::KEEP_IN_VIEW)
      redirect_to new_price_control_path, :notice => "The item has moved to KIV successfully."
    else
      flash[:alert] = @price_control_item.errors.full_messages.join(", ")
      redirect_to new_price_control_path
    end
  end
end
