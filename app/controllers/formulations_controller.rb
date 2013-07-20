class FormulationsController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  def index
    @search       = Formulation.search(params[:search])
    @formulations = Formulation.db_active(@search)
  end
  
  def kiv
    @search       = Formulation.search(params[:search])
    @formulations = Formulation.db_kiv(@search)
  end

  def show
    @formulation = Formulation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @formulation }
    end
  end

  def new
    @formulation = Formulation.new
  end

  def edit
    @formulation = Formulation.find(params[:id])
  end

  def create
    @formulation = Formulation.new(params[:formulation])
    if @formulation.save
      redirect_to @formulation, notice: ' New Formulation was successfully created.'
    else
      flash[:alert] = @formulation.errors.full_messages.join(", ")
      render action: "new"
    end
  end

  def update
    @formulation = Formulation.find(params[:id])
    if @formulation.update_attributes(params[:formulation])
      redirect_to @formulation, notice: 'Formulation was successfully updated.'
    else
      flash[:alert] = @formulation.errors.full_messages.join(", ")
      render action: "edit"
    end
  end

  def destroy
    @formulation = Formulation.find(params[:id])
    @formulation.update_attributes!(:status => DataStatus::KEEP_IN_VIEW)
    redirect_to formulations_url, :notice => "This formulation was dropped to KIV."
  end
  
  def recover
    @formulation = Formulation.find(params[:id])
    @formulation.update_attributes!(:status => DataStatus::ACTIVE)
    redirect_to kiv_formulations_url, :notice => "This formulation was recovered."
  end
  
  def output_value
    answer = Formulation.converting(params[:from_um], params[:to_um], params[:current_value])
    if answer.present?
      render :json => { "jstatus" => true, "result" => answer }
    else
      render :json => { "jstatus" => false }
    end
  end 
end
