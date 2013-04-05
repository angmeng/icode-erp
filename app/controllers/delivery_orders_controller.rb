class DeliveryOrdersController < ApplicationController
  before_filter :authenticate_user!
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  
  def index
    @search = DeliveryOrder.search(params[:search])
    @delivery_orders = DeliveryOrder.search_do(@search)
    @delivery_orders = @delivery_orders.paginate(:page => params[:page])
  end

  def show
    @delivery_order = DeliveryOrder.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @delivery_order }
    end
  end

  # GET /delivery_orders/new
  # GET /delivery_orders/new.json
  def new
    @delivery_order = DeliveryOrder.new
    @sales_order = SalesOrder.so_pid_desc
  end

  def edit
    @delivery_order = DeliveryOrder.find(params[:id])
  end

  def create
    @delivery_order = DeliveryOrder.new(params[:delivery_order])
    check_delivery_order, msg = DeliveryOrder.running_delivery_order_items(params[:datarow], @delivery_order)
    if @delivery_order.save and check_delivery_order.present?
      company.update_attributes(:sn_deliver_order_no => @delivery_order.do_no)
      redirect_to @delivery_order, notice: 'Delivery Order was successfully created.'
    else
      msg.present? ? msg : msg = []
      msg << @delivery_order.errors.full_messages
      flash[:alert] = msg.join(', ')
      render action: "new"
    end
  end

  def update
    @delivery_order = DeliveryOrder.find(params[:id])

    respond_to do |format|
      if @delivery_order.update_attributes(params[:delivery_order])
        format.html { redirect_to @delivery_order, notice: 'Delivery order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @delivery_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /delivery_orders/1
  # DELETE /delivery_orders/1.json
  def destroy
    @delivery_order = DeliveryOrder.find(params[:id])
    @delivery_order.destroy

    respond_to do |format|
      format.html { redirect_to delivery_orders_url }
      format.json { head :no_content }
    end
  end
end
