class PackingQuantitiesController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  # GET /packing_quantities
  # GET /packing_quantities.json
  def index
    @packing_quantities = PackingQuantity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @packing_quantities }
    end
  end

  # GET /packing_quantities/1
  # GET /packing_quantities/1.json
  def show
    @packing_quantity = PackingQuantity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @packing_quantity }
    end
  end

  # GET /packing_quantities/new
  # GET /packing_quantities/new.json
  def new
    @packing_quantity = PackingQuantity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @packing_quantity }
    end
  end

  # GET /packing_quantities/1/edit
  def edit
    @packing_quantity = PackingQuantity.find(params[:id])
  end

  # POST /packing_quantities
  # POST /packing_quantities.json
  def create
    @packing_quantity = PackingQuantity.new(params[:packing_quantity])

    respond_to do |format|
      if @packing_quantity.save
        format.html { redirect_to @packing_quantity, notice: 'Packing quantity was successfully created.' }
        format.json { render json: @packing_quantity, status: :created, location: @packing_quantity }
      else
        format.html { render action: "new" }
        format.json { render json: @packing_quantity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /packing_quantities/1
  # PUT /packing_quantities/1.json
  def update
    @packing_quantity = PackingQuantity.find(params[:id])

    respond_to do |format|
      if @packing_quantity.update_attributes(params[:packing_quantity])
        format.html { redirect_to @packing_quantity, notice: 'Packing quantity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @packing_quantity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /packing_quantities/1
  # DELETE /packing_quantities/1.json
  def destroy
    @packing_quantity = PackingQuantity.find(params[:id])
    @packing_quantity.destroy

    respond_to do |format|
      format.html { redirect_to packing_quantities_url }
      format.json { head :no_content }
    end
  end
end
