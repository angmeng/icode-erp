class TemporaryTarifCodesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_director
  # GET /temporary_tarif_codes
  # GET /temporary_tarif_codes.json
  def index
    @temporary_tarif_codes = TemporaryTarifCode.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @temporary_tarif_codes }
    end
  end

  # GET /temporary_tarif_codes/1
  # GET /temporary_tarif_codes/1.json
  def show
    @temporary_tarif_code = TemporaryTarifCode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @temporary_tarif_code }
    end
  end

  # GET /temporary_tarif_codes/new
  # GET /temporary_tarif_codes/new.json
  def new
    @temporary_tarif_code = TemporaryTarifCode.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @temporary_tarif_code }
    end
  end

  # GET /temporary_tarif_codes/1/edit
  def edit
    @temporary_tarif_code = TemporaryTarifCode.find(params[:id])
  end

  # POST /temporary_tarif_codes
  # POST /temporary_tarif_codes.json
  def create
    @temporary_tarif_code = TemporaryTarifCode.new(params[:temporary_tarif_code])

    respond_to do |format|
      if @temporary_tarif_code.save
        format.html { redirect_to @temporary_tarif_code, notice: 'Temporary tarif code was successfully created.' }
        format.json { render json: @temporary_tarif_code, status: :created, location: @temporary_tarif_code }
      else
        format.html { render action: "new" }
        format.json { render json: @temporary_tarif_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /temporary_tarif_codes/1
  # PUT /temporary_tarif_codes/1.json
  def update
    @temporary_tarif_code = TemporaryTarifCode.find(params[:id])

    respond_to do |format|
      if @temporary_tarif_code.update_attributes(params[:temporary_tarif_code])
        format.html { redirect_to @temporary_tarif_code, notice: 'Temporary tarif code was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @temporary_tarif_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /temporary_tarif_codes/1
  # DELETE /temporary_tarif_codes/1.json
  def destroy
    @temporary_tarif_code = TemporaryTarifCode.find(params[:id])
    @temporary_tarif_code.destroy

    respond_to do |format|
      format.html { redirect_to temporary_tarif_codes_url }
      format.json { head :no_content }
    end
  end
end
