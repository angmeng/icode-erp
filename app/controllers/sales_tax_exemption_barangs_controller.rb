class SalesTaxExemptionBarangsController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  # GET /sales_tax_exemption_barangs
  # GET /sales_tax_exemption_barangs.json
  def index
    @sales_tax_exemption_barangs = SalesTaxExemptionBarang.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sales_tax_exemption_barangs }
    end
  end

  # GET /sales_tax_exemption_barangs/1
  # GET /sales_tax_exemption_barangs/1.json
  def show
    @sales_tax_exemption_barang = SalesTaxExemptionBarang.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sales_tax_exemption_barang }
    end
  end

  # GET /sales_tax_exemption_barangs/new
  # GET /sales_tax_exemption_barangs/new.json
  def new
    @sales_tax_exemption_barang = SalesTaxExemptionBarang.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sales_tax_exemption_barang }
    end
  end

  # GET /sales_tax_exemption_barangs/1/edit
  def edit
    @sales_tax_exemption_barang = SalesTaxExemptionBarang.find(params[:id])
  end

  # POST /sales_tax_exemption_barangs
  # POST /sales_tax_exemption_barangs.json
  def create
    @sales_tax_exemption_barang = SalesTaxExemptionBarang.new(params[:sales_tax_exemption_barang])

    respond_to do |format|
      if @sales_tax_exemption_barang.save
        format.html { redirect_to @sales_tax_exemption_barang, notice: 'Sales tax exemption barang was successfully created.' }
        format.json { render json: @sales_tax_exemption_barang, status: :created, location: @sales_tax_exemption_barang }
      else
        format.html { render action: "new" }
        format.json { render json: @sales_tax_exemption_barang.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sales_tax_exemption_barangs/1
  # PUT /sales_tax_exemption_barangs/1.json
  def update
    @sales_tax_exemption_barang = SalesTaxExemptionBarang.find(params[:id])

    respond_to do |format|
      if @sales_tax_exemption_barang.update_attributes(params[:sales_tax_exemption_barang])
        format.html { redirect_to @sales_tax_exemption_barang, notice: 'Sales tax exemption barang was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sales_tax_exemption_barang.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales_tax_exemption_barangs/1
  # DELETE /sales_tax_exemption_barangs/1.json
  def destroy
    @sales_tax_exemption_barang = SalesTaxExemptionBarang.find(params[:id])
    @sales_tax_exemption_barang.destroy

    respond_to do |format|
      format.html { redirect_to sales_tax_exemption_barangs_url }
      format.json { head :no_content }
    end
  end
end
