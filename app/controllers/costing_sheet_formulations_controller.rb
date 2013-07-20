class CostingSheetFormulationsController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  def index
    @costing_sheet_formulations = CostingSheetFormulation.db_active

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @costing_sheet_formulations }
    end
  end

  # GET /costing_sheet_formulations/1
  # GET /costing_sheet_formulations/1.json
  def show
    @costing_sheet_formulation = CostingSheetFormulation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @costing_sheet_formulation }
    end
  end

  # GET /costing_sheet_formulations/new
  # GET /costing_sheet_formulations/new.json
  def new
    @costing_sheet_formulation = CostingSheetFormulation.new
    @last = CostingSheetFormulation.all.last

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @costing_sheet_formulation }
    end
  end

  # GET /costing_sheet_formulations/1/edit
  def edit
    @costing_sheet_formulation = CostingSheetFormulation.find(params[:id])
  end

  # POST /costing_sheet_formulations
  # POST /costing_sheet_formulations.json
  def create
    @costing_sheet_formulation = CostingSheetFormulation.new(params[:costing_sheet_formulation])

    respond_to do |format|
      if @costing_sheet_formulation.save
        format.html { redirect_to @costing_sheet_formulation, notice: 'Costing sheet formulation was successfully created.' }
        format.json { render json: @costing_sheet_formulation, status: :created, location: @costing_sheet_formulation }
      else
        format.html { render action: "new" }
        format.json { render json: @costing_sheet_formulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /costing_sheet_formulations/1
  # PUT /costing_sheet_formulations/1.json
  def update
    @costing_sheet_formulation = CostingSheetFormulation.find(params[:id])

    respond_to do |format|
      if @costing_sheet_formulation.update_attributes(params[:costing_sheet_formulation])
        format.html { redirect_to @costing_sheet_formulation, notice: 'Costing sheet formulation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @costing_sheet_formulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /costing_sheet_formulations/1
  # DELETE /costing_sheet_formulations/1.json
  def destroy
    @costing_sheet_formulation = CostingSheetFormulation.find(params[:id])
    @costing_sheet_formulation.update_attributes!(:status => CostingSheetFormulation::KEEP_IN_VIEW)

    respond_to do |format|
      format.html { redirect_to costing_sheet_formulations_url }
      format.json { head :no_content }
    end
  end
  
  def recover
    @costing_sheet_formulation = CostingSheetFormulation.find(params[:id])
    @costing_sheet_formulation.update_attributes!(:status => CostingSheetFormulation::ACTIVE)

    respond_to do |format|
      format.html { redirect_to kiv_costing_sheet_formulations_url }
      format.json { head :no_content }
    end
  end
  
  def kiv
    @costing_sheet_formulation = CostingSheetFormulation.db_kiv
  end
end
