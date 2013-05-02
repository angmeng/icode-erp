class SalesTaxExemptionLinesController < ApplicationController
  # GET /sales_tax_exemption_lines
  # GET /sales_tax_exemption_lines.json
  def index
    @sales_tax_exemption_lines = SalesTaxExemptionLine.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sales_tax_exemption_lines }
    end
  end

  # GET /sales_tax_exemption_lines/1
  # GET /sales_tax_exemption_lines/1.json
  def show
    @sales_tax_exemption_line = SalesTaxExemptionLine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sales_tax_exemption_line }
    end
  end

  # GET /sales_tax_exemption_lines/new
  # GET /sales_tax_exemption_lines/new.json
  def new
    @sales_tax_exemption_line = SalesTaxExemptionLine.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sales_tax_exemption_line }
    end
  end

  # GET /sales_tax_exemption_lines/1/edit
  def edit
    @sales_tax_exemption_line = SalesTaxExemptionLine.find(params[:id])
  end

  # POST /sales_tax_exemption_lines
  # POST /sales_tax_exemption_lines.json
  def create
    @sales_tax_exemption_line = SalesTaxExemptionLine.new(params[:sales_tax_exemption_line])

    respond_to do |format|
      if @sales_tax_exemption_line.save
        format.html { redirect_to @sales_tax_exemption_line, notice: 'Sales tax exemption line was successfully created.' }
        format.json { render json: @sales_tax_exemption_line, status: :created, location: @sales_tax_exemption_line }
      else
        format.html { render action: "new" }
        format.json { render json: @sales_tax_exemption_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sales_tax_exemption_lines/1
  # PUT /sales_tax_exemption_lines/1.json
  def update
    @sales_tax_exemption_line = SalesTaxExemptionLine.find(params[:id])

    respond_to do |format|
      if @sales_tax_exemption_line.update_attributes(params[:sales_tax_exemption_line])
        format.html { redirect_to @sales_tax_exemption_line, notice: 'Sales tax exemption line was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sales_tax_exemption_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales_tax_exemption_lines/1
  # DELETE /sales_tax_exemption_lines/1.json
  def destroy
    @sales_tax_exemption_line = SalesTaxExemptionLine.find(params[:id])
    @sales_tax_exemption_line.destroy

    respond_to do |format|
      format.html { redirect_to sales_tax_exemption_lines_url }
      format.json { head :no_content }
    end
  end
end
