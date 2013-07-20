class SalesTaxExemptionCustomerHistoriesController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  # GET /sales_tax_exemption_customer_histories
  # GET /sales_tax_exemption_customer_histories.json
  def index
    @sales_tax_exemption_customer_histories = SalesTaxExemptionCustomerHistory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sales_tax_exemption_customer_histories }
    end
  end

  # GET /sales_tax_exemption_customer_histories/1
  # GET /sales_tax_exemption_customer_histories/1.json
  def show
    @sales_tax_exemption_customer_history = SalesTaxExemptionCustomerHistory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sales_tax_exemption_customer_history }
    end
  end

  # GET /sales_tax_exemption_customer_histories/new
  # GET /sales_tax_exemption_customer_histories/new.json
  def new
    @sales_tax_exemption_customer_history = SalesTaxExemptionCustomerHistory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sales_tax_exemption_customer_history }
    end
  end

  # GET /sales_tax_exemption_customer_histories/1/edit
  def edit
    @sales_tax_exemption_customer_history = SalesTaxExemptionCustomerHistory.find(params[:id])
  end

  # POST /sales_tax_exemption_customer_histories
  # POST /sales_tax_exemption_customer_histories.json
  def create
    @sales_tax_exemption_customer_history = SalesTaxExemptionCustomerHistory.new(params[:sales_tax_exemption_customer_history])

    respond_to do |format|
      if @sales_tax_exemption_customer_history.save
        format.html { redirect_to @sales_tax_exemption_customer_history, notice: 'Sales tax exemption customer history was successfully created.' }
        format.json { render json: @sales_tax_exemption_customer_history, status: :created, location: @sales_tax_exemption_customer_history }
      else
        format.html { render action: "new" }
        format.json { render json: @sales_tax_exemption_customer_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sales_tax_exemption_customer_histories/1
  # PUT /sales_tax_exemption_customer_histories/1.json
  def update
    @sales_tax_exemption_customer_history = SalesTaxExemptionCustomerHistory.find(params[:id])

    respond_to do |format|
      if @sales_tax_exemption_customer_history.update_attributes(params[:sales_tax_exemption_customer_history])
        format.html { redirect_to @sales_tax_exemption_customer_history, notice: 'Sales tax exemption customer history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sales_tax_exemption_customer_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales_tax_exemption_customer_histories/1
  # DELETE /sales_tax_exemption_customer_histories/1.json
  def destroy
    @sales_tax_exemption_customer_history = SalesTaxExemptionCustomerHistory.find(params[:id])
    @sales_tax_exemption_customer_history.destroy

    respond_to do |format|
      format.html { redirect_to sales_tax_exemption_customer_histories_url }
      format.json { head :no_content }
    end
  end
end
