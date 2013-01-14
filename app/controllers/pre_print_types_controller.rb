class PrePrintTypesController < ApplicationController
  before_filter :authenticate_user!
  layout "sheetbox"
  # GET /pre_print_types
  # GET /pre_print_types.json
  def index
    @pre_print_types = PrePrintType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pre_print_types }
    end
  end

  # GET /pre_print_types/1
  # GET /pre_print_types/1.json
  def show
    @pre_print_type = PrePrintType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pre_print_type }
    end
  end

  # GET /pre_print_types/new
  # GET /pre_print_types/new.json
  def new
    @pre_print_type = PrePrintType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pre_print_type }
    end
  end

  # GET /pre_print_types/1/edit
  def edit
    @pre_print_type = PrePrintType.find(params[:id])
  end

  # POST /pre_print_types
  # POST /pre_print_types.json
  def create
    @pre_print_type = PrePrintType.new(params[:pre_print_type])

    respond_to do |format|
      if @pre_print_type.save
        format.html { redirect_to @pre_print_type, notice: 'Pre print type was successfully created.' }
        format.json { render json: @pre_print_type, status: :created, location: @pre_print_type }
      else
        format.html { render action: "new" }
        format.json { render json: @pre_print_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pre_print_types/1
  # PUT /pre_print_types/1.json
  def update
    @pre_print_type = PrePrintType.find(params[:id])

    respond_to do |format|
      if @pre_print_type.update_attributes(params[:pre_print_type])
        format.html { redirect_to @pre_print_type, notice: 'Pre print type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pre_print_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pre_print_types/1
  # DELETE /pre_print_types/1.json
  def destroy
    @pre_print_type = PrePrintType.find(params[:id])
    @pre_print_type.destroy

    respond_to do |format|
      format.html { redirect_to pre_print_types_url }
      format.json { head :no_content }
    end
  end
end
