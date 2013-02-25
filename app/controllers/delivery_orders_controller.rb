class DeliveryOrdersController < ApplicationController
  before_filter :authenticate_user!
  layout "sheetbox", :only => [:new, :show, :edit]
  
  def index
    @search = DeliveryOrder.search(params[:search])
    @delivery_orders = @search.all
  end

  # GET /delivery_orders/1
  # GET /delivery_orders/1.json
  def show
    @delivery_order = DeliveryOrder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @delivery_order }
    end
  end

  # GET /delivery_orders/new
  # GET /delivery_orders/new.json
  def new
    @delivery_order = DeliveryOrder.new
  end

  # GET /delivery_orders/1/edit
  def edit
    @delivery_order = DeliveryOrder.find(params[:id])
  end

  # POST /delivery_orders
  # POST /delivery_orders.json
  def create
    @delivery_order = DeliveryOrder.new(params[:delivery_order])
    do_running = company.sn_deliver_order_no + 1
    @delivery_order.do_no = do_running
    check_delivery_order, msg = DeliveryOrder.running_delivery_order_items(params[:datarow], @delivery_order)

    if @delivery_order.save and check_delivery_order.present?
      company.update_attributes(:sn_deliver_order_no => do_running)
      redirect_to @delivery_order, notice: 'Delivery Order was successfully created.'
    else
      msg << @delivery_order.errors.full_messages
      flash[:alert] = msg.join(', ')
      render action: "new"
    end
  end

  # PUT /delivery_orders/1
  # PUT /delivery_orders/1.json
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
