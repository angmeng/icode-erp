class BillOfMaterialsController < ApplicationController
  before_filter :authenticate_user!
  layout "sheetbox"
  # GET /bill_of_materials
  # GET /bill_of_materials.json
  def index
    @bill_of_materials = BillOfMaterial.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bill_of_materials }
    end
  end

  # GET /bill_of_materials/1
  # GET /bill_of_materials/1.json
  def show
    @bill_of_material = BillOfMaterial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bill_of_material }
    end
  end

  # GET /bill_of_materials/new
  # GET /bill_of_materials/new.json
  def new
    @bill_of_material = BillOfMaterial.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bill_of_material }
    end
  end

  # GET /bill_of_materials/1/edit
  def edit
    @bill_of_material = BillOfMaterial.find(params[:id])
  end

  # POST /bill_of_materials
  # POST /bill_of_materials.json
  def create
    @bill_of_material = BillOfMaterial.new(params[:bill_of_material])

    respond_to do |format|
      if @bill_of_material.save
        format.html { redirect_to @bill_of_material, notice: 'Bill of material was successfully created.' }
        format.json { render json: @bill_of_material, status: :created, location: @bill_of_material }
      else
        format.html { render action: "new" }
        format.json { render json: @bill_of_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bill_of_materials/1
  # PUT /bill_of_materials/1.json
  def update
    @bill_of_material = BillOfMaterial.find(params[:id])

    respond_to do |format|
      if @bill_of_material.update_attributes(params[:bill_of_material])
        format.html { redirect_to @bill_of_material, notice: 'Bill of material was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bill_of_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bill_of_materials/1
  # DELETE /bill_of_materials/1.json
  def destroy
    @bill_of_material = BillOfMaterial.find(params[:id])
    @bill_of_material.destroy

    respond_to do |format|
      format.html { redirect_to bill_of_materials_url }
      format.json { head :no_content }
    end
  end
end
