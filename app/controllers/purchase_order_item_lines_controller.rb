class PurchaseOrderItemLinesController < ApplicationController
  before_filter :authenticate_user!
  layout "sheetbox"
  
  def index
    @purchase_order_item_lines = PurchaseOrderItemLine.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @purchase_order_item_lines }
    end
  end

  # GET /purchase_order_item_lines/1
  # GET /purchase_order_item_lines/1.json
  def show
    @purchase_order_item_line = PurchaseOrderItemLine.find(params[:id])

#    respond_to do |format|
#      format.html # show.html.erb
#      format.json { render json: @purchase_order_item_line }
#    end
  end

  # GET /purchase_order_item_lines/new
  # GET /purchase_order_item_lines/new.json
  def new
    @purchase_order_item_line = PurchaseOrderItemLine.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @purchase_order_item_line }
    end
  end

  # GET /purchase_order_item_lines/1/edit
  def edit
    @purchase_order_item_line = PurchaseOrderItemLine.find(params[:id])
  end

  # POST /purchase_order_item_lines
  # POST /purchase_order_item_lines.json
  def create
    @purchase_order_item_line = PurchaseOrderItemLine.new(params[:purchase_order_item_line])

    respond_to do |format|
      if @purchase_order_item_line.save
        format.html { redirect_to @purchase_order_item_line, notice: 'Purchase order item line was successfully created.' }
        format.json { render json: @purchase_order_item_line, status: :created, location: @purchase_order_item_line }
      else
        format.html { render action: "new" }
        format.json { render json: @purchase_order_item_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /purchase_order_item_lines/1
  # PUT /purchase_order_item_lines/1.json
  def update
    @purchase_order_item_line = PurchaseOrderItemLine.find(params[:id])

    respond_to do |format|
      if @purchase_order_item_line.update_attributes(params[:purchase_order_item_line])
        format.html { redirect_to @purchase_order_item_line, notice: 'Purchase order item line was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @purchase_order_item_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /purchase_order_item_lines/1
  # DELETE /purchase_order_item_lines/1.json
  def destroy
    @purchase_order_item_line = PurchaseOrderItemLine.find(params[:id])
    @purchase_order_item_line.destroy

    respond_to do |format|
      format.html { redirect_to purchase_order_item_lines_url }
      format.json { head :no_content }
    end
  end
end
