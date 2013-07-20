class CustomProductionsController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  # GET /custom_productions
  # GET /custom_productions.json
  def index
    @custom_productions = CustomProduction.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @custom_productions }
    end
  end

  # GET /custom_productions/1
  # GET /custom_productions/1.json
  def show
    @custom_production = CustomProduction.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @custom_production }
    end
  end

  # GET /custom_productions/new
  # GET /custom_productions/new.json
  def new
    @custom_production = CustomProduction.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @custom_production }
    end
  end

  # GET /custom_productions/1/edit
  def edit
    @custom_production = CustomProduction.find(params[:id])
  end

  # POST /custom_productions
  # POST /custom_productions.json
  def create
    @custom_production = CustomProduction.new(params[:custom_production])

    respond_to do |format|
      if @custom_production.save
        format.html { redirect_to @custom_production, notice: 'Custom production was successfully created.' }
        format.json { render json: @custom_production, status: :created, location: @custom_production }
      else
        format.html { render action: "new" }
        format.json { render json: @custom_production.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /custom_productions/1
  # PUT /custom_productions/1.json
  def update
    @custom_production = CustomProduction.find(params[:id])

    respond_to do |format|
      if @custom_production.update_attributes(params[:custom_production])
        format.html { redirect_to @custom_production, notice: 'Custom production was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @custom_production.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /custom_productions/1
  # DELETE /custom_productions/1.json
  def destroy
    @custom_production = CustomProduction.find(params[:id])
    @custom_production.destroy

    respond_to do |format|
      format.html { redirect_to custom_productions_url }
      format.json { head :no_content }
    end
  end
end
