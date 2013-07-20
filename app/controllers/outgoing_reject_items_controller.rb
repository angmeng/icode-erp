class OutgoingRejectItemsController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  # GET /outgoing_reject_items
  # GET /outgoing_reject_items.json
  def index
    @outgoing_reject_items = OutgoingRejectItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @outgoing_reject_items }
    end
  end

  # GET /outgoing_reject_items/1
  # GET /outgoing_reject_items/1.json
  def show
    @outgoing_reject_item = OutgoingRejectItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @outgoing_reject_item }
    end
  end

  # GET /outgoing_reject_items/new
  # GET /outgoing_reject_items/new.json
  def new
    @outgoing_reject_item = OutgoingRejectItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @outgoing_reject_item }
    end
  end

  # GET /outgoing_reject_items/1/edit
  def edit
    @outgoing_reject_item = OutgoingRejectItem.find(params[:id])
  end

  # POST /outgoing_reject_items
  # POST /outgoing_reject_items.json
  def create
    @outgoing_reject_item = OutgoingRejectItem.new(params[:outgoing_reject_item])

    respond_to do |format|
      if @outgoing_reject_item.save
        format.html { redirect_to @outgoing_reject_item, notice: 'Outgoing reject item was successfully created.' }
        format.json { render json: @outgoing_reject_item, status: :created, location: @outgoing_reject_item }
      else
        format.html { render action: "new" }
        format.json { render json: @outgoing_reject_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /outgoing_reject_items/1
  # PUT /outgoing_reject_items/1.json
  def update
    @outgoing_reject_item = OutgoingRejectItem.find(params[:id])

    respond_to do |format|
      if @outgoing_reject_item.update_attributes(params[:outgoing_reject_item])
        format.html { redirect_to @outgoing_reject_item, notice: 'Outgoing reject item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @outgoing_reject_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outgoing_reject_items/1
  # DELETE /outgoing_reject_items/1.json
  def destroy
    @outgoing_reject_item = OutgoingRejectItem.find(params[:id])
    @outgoing_reject_item.destroy

    respond_to do |format|
      format.html { redirect_to outgoing_reject_items_url }
      format.json { head :no_content }
    end
  end
end
