class ProductCustomersController < ApplicationController
  before_filter :authenticate_user!
  # GET /product_customers
  # GET /product_customers.json
  def index
    @product_customers = ProductCustomer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_customers }
    end
  end

  # GET /product_customers/1
  # GET /product_customers/1.json
  def show
    @product_customer = ProductCustomer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_customer }
    end
  end

  # GET /product_customers/new
  # GET /product_customers/new.json
  def new
    @product_customer = ProductCustomer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_customer }
    end
  end

  # GET /product_customers/1/edit
  def edit
    @product_customer = ProductCustomer.find(params[:id])
  end

  # POST /product_customers
  # POST /product_customers.json
  def create
    @product_customer = ProductCustomer.new(params[:product_customer])

    respond_to do |format|
      if @product_customer.save
        format.html { redirect_to @product_customer, notice: 'Product customer was successfully created.' }
        format.json { render json: @product_customer, status: :created, location: @product_customer }
      else
        format.html { render action: "new" }
        format.json { render json: @product_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_customers/1
  # PUT /product_customers/1.json
  def update
    @product_customer = ProductCustomer.find(params[:id])

    respond_to do |format|
      if @product_customer.update_attributes(params[:product_customer])
        format.html { redirect_to @product_customer, notice: 'Product customer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_customers/1
  # DELETE /product_customers/1.json
  def destroy
    @product_customer = ProductCustomer.find(params[:id])
    @product_customer.destroy

    respond_to do |format|
      format.html { redirect_to product_customers_url }
      format.json { head :no_content }
    end
  end
  
  def take_data
    @pc = ProductCustomer.take_unit_price(params[:product_id], params[:company_id])
    @product = Product.find(params[:product_id])
    if @pc.present?
      render json: @pc.attributes.merge({"jstatus" => true, :part_no => @product.part_code })
    else
      render json: { :jstatus => false }
    end
  end
  
  
  def matching_product_customer
    ev = []
    @product_customer = ProductCustomer.find_by_product_id_and_trade_company_id(params[:product_id], params[:company_id])
    if @product_customer.present?
      ev << {
        :description => "#{@product_customer.product.desc}", 
        :unit_measurement_id => "#{@product_customer.product.unit_measurement.id}", 
        :unit_measurement_code => "#{@product_customer.product.unit_measurement.code}", 
        :selling_price => "#{@product_customer.selling_price}", 
        :current_stock => "#{@product_customer.product.current_stock}",
        :match => true
      }
    else
      ev << { :match => false }
    end

    respond_to do |format|
      format.html
      format.json { render json: ev }
    end
  end
end
