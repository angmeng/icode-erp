class ProductRunningNumbersController < ApplicationController
  # GET /product_running_numbers
  # GET /product_running_numbers.json
  def index
    @product_running_numbers = ProductRunningNumber.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_running_numbers }
    end
  end

  # GET /product_running_numbers/1
  # GET /product_running_numbers/1.json
  def show
    @product_running_number = ProductRunningNumber.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_running_number }
    end
  end

  # GET /product_running_numbers/new
  # GET /product_running_numbers/new.json
  def new
    @product_running_number = ProductRunningNumber.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_running_number }
    end
  end

  # GET /product_running_numbers/1/edit
  def edit
    @product_running_number = ProductRunningNumber.find(params[:id])
  end

  # POST /product_running_numbers
  # POST /product_running_numbers.json
  def create
    @product_running_number = ProductRunningNumber.new(params[:product_running_number])

    respond_to do |format|
      if @product_running_number.save
        format.html { redirect_to @product_running_number, notice: 'Product running number was successfully created.' }
        format.json { render json: @product_running_number, status: :created, location: @product_running_number }
      else
        format.html { render action: "new" }
        format.json { render json: @product_running_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_running_numbers/1
  # PUT /product_running_numbers/1.json
  def update
    @product_running_number = ProductRunningNumber.find(params[:id])

    respond_to do |format|
      if @product_running_number.update_attributes(params[:product_running_number])
        format.html { redirect_to @product_running_number, notice: 'Product running number was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_running_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_running_numbers/1
  # DELETE /product_running_numbers/1.json
  def destroy
    @product_running_number = ProductRunningNumber.find(params[:id])
    @product_running_number.destroy

    respond_to do |format|
      format.html { redirect_to product_running_numbers_url }
      format.json { head :no_content }
    end
  end
end
