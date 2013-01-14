class SalesOrderItemsController < ApplicationController
  before_filter :authenticate_user!
  layout "sheetbox"

  def index
    @sales_order_items = SalesOrderItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sales_order_items }
    end
  end

  def show
    @sales_order_item = SalesOrderItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sales_order_item }
    end
  end

  def new
    @sales_order_item = SalesOrderItem.new
    @company_id = params[:company_id]
  end

  def edit
    @sales_order_item = SalesOrderItem.find(params[:id])
    @finish_goods = ProductCategory.finish_goods
  end

  def create
    @sales_order_item = SalesOrderItem.new(params[:sales_order_item])

    if @sales_order_item.save
      redirect_to @sales_order_item, notice: 'Sales order item was successfully created.'
    else
      flash[:alert] = @sales_order_item.errors.full_messages.join(", ")
      render "new"
    end
  end

  def update
    @sales_order_item = SalesOrderItem.find(params[:id])

    respond_to do |format|
      if @sales_order_item.update_attributes(params[:sales_order_item])
        format.html { redirect_to @sales_order_item, notice: 'Sales order item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sales_order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sales_order_item = SalesOrderItem.find(params[:id])
    @sales_order_item.update_attributes(:status => SalesOrderItem::KEEP_IN_VIEW)

    respond_to do |format|
      format.html { redirect_to new_sales_order_path, :notice => "SO Item ID##{@sales_order_item.id} was moved to KIV successfully." }
      format.json { head :no_content }
    end
  end
  
  def recover
    @sales_order_item = SalesOrderItem.find(params[:id])
    @sales_order_item.update_attributes(:status => SalesOrderItem::PENDING)

    respond_to do |format|
      format.html { redirect_to kiv_sales_order_items_path, :notice => "SO Item ID##{@sales_order_item.id} was recovered from KIV." }
      format.json { head :no_content }
    end
  end
  
  def kiv
    @sales_order_items = SalesOrderItem.where(:status => SalesOrderItem::KEEP_IN_VIEW)
  end
end
