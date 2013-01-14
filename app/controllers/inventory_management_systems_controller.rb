class InventoryManagementSystemsController < ApplicationController
  before_filter :authenticate_user!
  # GET /inventory_management_systems
  # GET /inventory_management_systems.json
  def index
    @inventory_management_systems = InventoryManagementSystem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @inventory_management_systems }
    end
  end

  # GET /inventory_management_systems/1
  # GET /inventory_management_systems/1.json
  def show
    @inventory_management_system = InventoryManagementSystem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @inventory_management_system }
    end
  end

  # GET /inventory_management_systems/new
  # GET /inventory_management_systems/new.json
  def new
    @inventory_management_system = InventoryManagementSystem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @inventory_management_system }
    end
  end

  # GET /inventory_management_systems/1/edit
  def edit
    @inventory_management_system = InventoryManagementSystem.find(params[:id])
  end

  # POST /inventory_management_systems
  # POST /inventory_management_systems.json
  def create
    @inventory_management_system = InventoryManagementSystem.new(params[:inventory_management_system])

    respond_to do |format|
      if @inventory_management_system.save
        format.html { redirect_to @inventory_management_system, notice: 'Inventory management system was successfully created.' }
        format.json { render json: @inventory_management_system, status: :created, location: @inventory_management_system }
      else
        format.html { render action: "new" }
        format.json { render json: @inventory_management_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /inventory_management_systems/1
  # PUT /inventory_management_systems/1.json
  def update
    @inventory_management_system = InventoryManagementSystem.find(params[:id])

    respond_to do |format|
      if @inventory_management_system.update_attributes(params[:inventory_management_system])
        format.html { redirect_to @inventory_management_system, notice: 'Inventory management system was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @inventory_management_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventory_management_systems/1
  # DELETE /inventory_management_systems/1.json
  def destroy
    @inventory_management_system = InventoryManagementSystem.find(params[:id])
    @inventory_management_system.destroy

    respond_to do |format|
      format.html { redirect_to inventory_management_systems_url }
      format.json { head :no_content }
    end
  end
end
