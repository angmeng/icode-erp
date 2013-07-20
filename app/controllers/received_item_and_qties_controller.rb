class ReceivedItemAndQtiesController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  # GET /received_item_and_qties
  # GET /received_item_and_qties.json
  def index
    @received_item_and_qties = ReceivedItemAndQty.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @received_item_and_qties }
    end
  end

  # GET /received_item_and_qties/1
  # GET /received_item_and_qties/1.json
  def show
    @received_item_and_qty = ReceivedItemAndQty.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @received_item_and_qty }
    end
  end

  # GET /received_item_and_qties/new
  # GET /received_item_and_qties/new.json
  def new
    @received_item_and_qty = ReceivedItemAndQty.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @received_item_and_qty }
    end
  end

  # GET /received_item_and_qties/1/edit
  def edit
    @received_item_and_qty = ReceivedItemAndQty.find(params[:id])
  end

  # POST /received_item_and_qties
  # POST /received_item_and_qties.json
  def create
    @received_item_and_qty = ReceivedItemAndQty.new(params[:received_item_and_qty])

    respond_to do |format|
      if @received_item_and_qty.save
        format.html { redirect_to @received_item_and_qty, notice: 'Received item and qty was successfully created.' }
        format.json { render json: @received_item_and_qty, status: :created, location: @received_item_and_qty }
      else
        format.html { render action: "new" }
        format.json { render json: @received_item_and_qty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /received_item_and_qties/1
  # PUT /received_item_and_qties/1.json
  def update
    @received_item_and_qty = ReceivedItemAndQty.find(params[:id])

    respond_to do |format|
      if @received_item_and_qty.update_attributes(params[:received_item_and_qty])
        format.html { redirect_to @received_item_and_qty, notice: 'Received item and qty was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @received_item_and_qty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /received_item_and_qties/1
  # DELETE /received_item_and_qties/1.json
  def destroy
    @received_item_and_qty = ReceivedItemAndQty.find(params[:id])
    @received_item_and_qty.destroy

    respond_to do |format|
      format.html { redirect_to received_item_and_qties_url }
      format.json { head :no_content }
    end
  end
end
