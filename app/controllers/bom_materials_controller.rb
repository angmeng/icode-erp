class BomMaterialsController < ApplicationController
  # GET /bom_materials
  # GET /bom_materials.json
  def index
    @bom_materials = BomMaterial.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @bom_materials }
    end
  end

  # GET /bom_materials/1
  # GET /bom_materials/1.json
  def show
    @bom_material = BomMaterial.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bom_material }
    end
  end

  # GET /bom_materials/new
  # GET /bom_materials/new.json
  def new
    @bom_material = BomMaterial.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bom_material }
    end
  end

  # GET /bom_materials/1/edit
  def edit
    @bom_material = BomMaterial.find(params[:id])
  end

  # POST /bom_materials
  # POST /bom_materials.json
  def create
    @bom_material = BomMaterial.new(params[:bom_material])

    respond_to do |format|
      if @bom_material.save
        format.html { redirect_to @bom_material, notice: 'Bom material was successfully created.' }
        format.json { render json: @bom_material, status: :created, location: @bom_material }
      else
        format.html { render action: "new" }
        format.json { render json: @bom_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /bom_materials/1
  # PUT /bom_materials/1.json
  def update
    @bom_material = BomMaterial.find(params[:id])

    respond_to do |format|
      if @bom_material.update_attributes(params[:bom_material])
        format.html { redirect_to @bom_material, notice: 'Bom material was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bom_material.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bom_materials/1
  # DELETE /bom_materials/1.json
  def destroy
    @bom_material = BomMaterial.find(params[:id])
    @bom_material.destroy

    respond_to do |format|
      format.html { redirect_to bom_materials_url }
      format.json { head :no_content }
    end
  end
end
