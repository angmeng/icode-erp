class TypeOfSalesController < ApplicationController
  before_filter :is_director
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  # GET /type_of_sales
  # GET /type_of_sales.json
  def index
    @type_of_sales = TypeOfSale.all

#    respond_to do |format|
#      format.html # index.html.erb
#      format.json { render json: @type_of_sales }
#    end
  end

  # GET /type_of_sales/1
  # GET /type_of_sales/1.json
  def show
    @type_of_sale = TypeOfSale.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @type_of_sale }
    end
  end

  # GET /type_of_sales/new
  # GET /type_of_sales/new.json
  def new
    @type_of_sale = TypeOfSale.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @type_of_sale }
    end
  end

  # GET /type_of_sales/1/edit
  def edit
    @type_of_sale = TypeOfSale.find(params[:id])
  end

  # POST /type_of_sales
  # POST /type_of_sales.json
  def create
    @type_of_sale = TypeOfSale.new(params[:type_of_sale])

    respond_to do |format|
      if @type_of_sale.save
        format.html { redirect_to @type_of_sale, notice: 'Type of sale was successfully created.' }
        format.json { render json: @type_of_sale, status: :created, location: @type_of_sale }
      else
        format.html { render action: "new" }
        format.json { render json: @type_of_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /type_of_sales/1
  # PUT /type_of_sales/1.json
  def update
    @type_of_sale = TypeOfSale.find(params[:id])

    respond_to do |format|
      if @type_of_sale.update_attributes(params[:type_of_sale])
        format.html { redirect_to @type_of_sale, notice: 'Type of sale was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @type_of_sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /type_of_sales/1
  # DELETE /type_of_sales/1.json
  def destroy
    @type_of_sale = TypeOfSale.find(params[:id])
    @type_of_sale.destroy

    respond_to do |format|
      format.html { redirect_to type_of_sales_url }
      format.json { head :no_content }
    end
  end
end
