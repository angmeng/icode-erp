class FormulationsController < ApplicationController
  before_filter :authenticate_user!
  layout false
  
  # GET /formulations
  # GET /formulations.json
  def index
    @formulations = Formulation.all
    if params[:from_um].present? && params[:to_um].present? && params[:current_value].present?
      params[:convert_value] = Formulation.converting(params[:from_um].to_i, params[:to_um].to_i, params[:current_value].to_f)
    end
    render :layout => "application"
  end

  # GET /formulations/1
  # GET /formulations/1.json
  def show
    @formulation = Formulation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @formulation }
    end
  end

  # GET /formulations/new
  # GET /formulations/new.json
  def new
    @formulation = Formulation.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @formulation }
    end
  end

  # GET /formulations/1/edit
  def edit
    @formulation = Formulation.find(params[:id])
  end

  # POST /formulations
  # POST /formulations.json
  def create
    @formulation = Formulation.new(params[:formulation])

    if @formulation.save
      redirect_to @formulation, notice: 'Formulation was successfully created.'
    else
      flash[:alert] = @formulation.errors.full_messages.join(", ")
      render action: "new"
    end
  end

  # PUT /formulations/1
  # PUT /formulations/1.json
  def update
    @formulation = Formulation.find(params[:id])

    respond_to do |format|
      if @formulation.update_attributes(params[:formulation])
        format.html { redirect_to @formulation, notice: 'Formulation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @formulation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /formulations/1
  # DELETE /formulations/1.json
  def destroy
    @formulation = Formulation.find(params[:id])
    @formulation.destroy

    respond_to do |format|
      format.html { redirect_to formulations_url }
      format.json { head :no_content }
    end
  end
end
