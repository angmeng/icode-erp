class PriceControlItemsController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  def index
    @price_control_items = PriceControlItem.ordering_price_control_item.find_all_by_product_id(params[:id])
    @product_detail      = @price_control_items.first
    @price_control_items = @price_control_items.group_by(&:price_control_trade_company_id)
  end

  def show
    @price_control_item = PriceControlItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @price_control_item }
    end
  end

  def new
    @price_control_item = PriceControlItem.new
  end

  def edit
    @price_control_item = PriceControlItem.find(params[:id])
  end

  def create
    @price_control_item = PriceControlItem.new(params[:price_control_item])

    if @price_control_item.save
      redirect_to @price_control_item, notice: 'Price control item was successfully created.'
    else
      flash[:alert] = @price_control_item.errors.full_messages.join(', ')
      render action: "new" 
    end
  end
  
  def update
    @price_control_item = PriceControlItem.find(params[:id])

    if @price_control_item.update_attributes(params[:price_control_item])
      redirect_to @price_control_item, notice: 'Price control item was successfully updated.'
    else
      flash[:alert] = @price_control_item.errors.full_messages.join(', ')
      render action: "edit"
    end
  end

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
