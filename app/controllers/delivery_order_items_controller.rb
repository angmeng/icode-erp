class DeliveryOrderItemsController < ApplicationController
  # GET /delivery_order_items
  # GET /delivery_order_items.json
  def index
    @delivery_order_items = DeliveryOrderItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @delivery_order_items }
    end
  end

  # GET /delivery_order_items/1
  # GET /delivery_order_items/1.json
  def show
    @delivery_order_item = DeliveryOrderItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @delivery_order_item }
    end
  end

  # GET /delivery_order_items/new
  # GET /delivery_order_items/new.json
  def new
    @delivery_order_item = DeliveryOrderItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @delivery_order_item }
    end
  end

  # GET /delivery_order_items/1/edit
  def edit
    @delivery_order_item = DeliveryOrderItem.find(params[:id])
  end

  # POST /delivery_order_items
  # POST /delivery_order_items.json
  def create
    @delivery_order_item = DeliveryOrderItem.new(params[:delivery_order_item])

    respond_to do |format|
      if @delivery_order_item.save
        format.html { redirect_to @delivery_order_item, notice: 'Delivery order item was successfully created.' }
        format.json { render json: @delivery_order_item, status: :created, location: @delivery_order_item }
      else
        format.html { render action: "new" }
        format.json { render json: @delivery_order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /delivery_order_items/1
  # PUT /delivery_order_items/1.json
  def update
    @delivery_order_item = DeliveryOrderItem.find(params[:id])

    respond_to do |format|
      if @delivery_order_item.update_attributes(params[:delivery_order_item])
        format.html { redirect_to @delivery_order_item, notice: 'Delivery order item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @delivery_order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /delivery_order_items/1
  # DELETE /delivery_order_items/1.json
  def destroy
    @delivery_order_item = DeliveryOrderItem.find(params[:id])
    @delivery_order_item.destroy

    respond_to do |format|
      format.html { redirect_to delivery_order_items_url }
      format.json { head :no_content }
    end
  end
end
