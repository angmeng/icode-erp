class MaterialOfQuantitiesController < ApplicationController
  before_filter :authenticate_user!
  # GET /material_of_quantities
  # GET /material_of_quantities.json
  def index
    @material_of_quantities = MaterialOfQuantity.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @material_of_quantities }
    end
  end

  # GET /material_of_quantities/1
  # GET /material_of_quantities/1.json
  def show
    @material_of_quantity = MaterialOfQuantity.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @material_of_quantity }
    end
  end

  # GET /material_of_quantities/new
  # GET /material_of_quantities/new.json
  def new
    @material_of_quantity = MaterialOfQuantity.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @material_of_quantity }
    end
  end

  # GET /material_of_quantities/1/edit
  def edit
    @material_of_quantity = MaterialOfQuantity.find(params[:id])
  end

  # POST /material_of_quantities
  # POST /material_of_quantities.json
  def create
    @material_of_quantity = MaterialOfQuantity.new(params[:material_of_quantity])

    respond_to do |format|
      if @material_of_quantity.save
        format.html { redirect_to @material_of_quantity, notice: 'Material of quantity was successfully created.' }
        format.json { render json: @material_of_quantity, status: :created, location: @material_of_quantity }
      else
        format.html { render action: "new" }
        format.json { render json: @material_of_quantity.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /material_of_quantities/1
  # PUT /material_of_quantities/1.json
  def update
    @material_of_quantity = MaterialOfQuantity.find(params[:id])

    respond_to do |format|
      if @material_of_quantity.update_attributes(params[:material_of_quantity])
        format.html { redirect_to @material_of_quantity, notice: 'Material of quantity was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @material_of_quantity.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /material_of_quantities/1
  # DELETE /material_of_quantities/1.json
  def destroy
    @material_of_quantity = MaterialOfQuantity.find(params[:id])
    @material_of_quantity.destroy

    respond_to do |format|
      format.html { redirect_to material_of_quantities_url }
      format.json { head :no_content }
    end
  end
end
