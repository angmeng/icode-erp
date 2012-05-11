class UnitMeasurementsController < ApplicationController
  # GET /unit_measurements
  # GET /unit_measurements.json
  def index
    @unit_measurements = UnitMeasurement.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @unit_measurements }
    end
  end

  # GET /unit_measurements/1
  # GET /unit_measurements/1.json
  def show
    @unit_measurement = UnitMeasurement.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @unit_measurement }
    end
  end

  # GET /unit_measurements/new
  # GET /unit_measurements/new.json
  def new
    @unit_measurement = UnitMeasurement.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @unit_measurement }
    end
  end

  # GET /unit_measurements/1/edit
  def edit
    @unit_measurement = UnitMeasurement.find(params[:id])
  end

  # POST /unit_measurements
  # POST /unit_measurements.json
  def create
    @unit_measurement = UnitMeasurement.new(params[:unit_measurement])

    respond_to do |format|
      if @unit_measurement.save
        format.html { redirect_to @unit_measurement, notice: 'Unit measurement was successfully created.' }
        format.json { render json: @unit_measurement, status: :created, location: @unit_measurement }
      else
        format.html { render action: "new" }
        format.json { render json: @unit_measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /unit_measurements/1
  # PUT /unit_measurements/1.json
  def update
    @unit_measurement = UnitMeasurement.find(params[:id])

    respond_to do |format|
      if @unit_measurement.update_attributes(params[:unit_measurement])
        format.html { redirect_to @unit_measurement, notice: 'Unit measurement was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @unit_measurement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /unit_measurements/1
  # DELETE /unit_measurements/1.json
  def destroy
    @unit_measurement = UnitMeasurement.find(params[:id])
    @unit_measurement.destroy

    respond_to do |format|
      format.html { redirect_to unit_measurements_url }
      format.json { head :no_content }
    end
  end
end
