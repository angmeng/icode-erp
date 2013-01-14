class SalesTaxExemptionItemsController < ApplicationController
  before_filter :authenticate_user!
  # GET /sales_tax_exemption_items
  # GET /sales_tax_exemption_items.json
  def index
    @sales_tax_exemption_items = SalesTaxExemptionItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sales_tax_exemption_items }
    end
  end

  # GET /sales_tax_exemption_items/1
  # GET /sales_tax_exemption_items/1.json
  def show
    @sales_tax_exemption_item = SalesTaxExemptionItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sales_tax_exemption_item }
    end
  end

  # GET /sales_tax_exemption_items/new
  # GET /sales_tax_exemption_items/new.json
  def new
    @sales_tax_exemption_item = SalesTaxExemptionItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sales_tax_exemption_item }
    end
  end

  # GET /sales_tax_exemption_items/1/edit
  def edit
    @sales_tax_exemption_item = SalesTaxExemptionItem.find(params[:id])
  end

  # POST /sales_tax_exemption_items
  # POST /sales_tax_exemption_items.json
  def create
    @sales_tax_exemption_item = SalesTaxExemptionItem.new(params[:sales_tax_exemption_item])

    respond_to do |format|
      if @sales_tax_exemption_item.save
        format.html { redirect_to @sales_tax_exemption_item, notice: 'Sales tax exemption item was successfully created.' }
        format.json { render json: @sales_tax_exemption_item, status: :created, location: @sales_tax_exemption_item }
      else
        format.html { render action: "new" }
        format.json { render json: @sales_tax_exemption_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sales_tax_exemption_items/1
  # PUT /sales_tax_exemption_items/1.json
  def update
    @sales_tax_exemption_item = SalesTaxExemptionItem.find(params[:id])

    respond_to do |format|
      if @sales_tax_exemption_item.update_attributes(params[:sales_tax_exemption_item])
        format.html { redirect_to @sales_tax_exemption_item, notice: 'Sales tax exemption item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sales_tax_exemption_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales_tax_exemption_items/1
  # DELETE /sales_tax_exemption_items/1.json
  def destroy
    @sales_tax_exemption_item = SalesTaxExemptionItem.find(params[:id])
    @sales_tax_exemption_item.destroy

    respond_to do |format|
      format.html { redirect_to sales_tax_exemption_items_url }
      format.json { head :no_content }
    end
  end
end
