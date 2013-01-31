class CurrenciesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :are_you_director?
  layout "sheetbox"

  def index
    @search = Currency.search(params[:search])
    @currencies = Currency.ordered_name(@search)
  end
  
  def kiv
    @search = Currency.search(params[:search])
    @currencies = Currency.ordered_name_kiv(@search)
  end

  # GET /currencies/1
  # GET /currencies/1.json
  def show
    @currency = Currency.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @currency }
    end
  end

  # GET /currencies/new
  # GET /currencies/new.json
  def new
    @currency = Currency.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @currency }
    end
  end

  # GET /currencies/1/edit
  def edit
    @currency = Currency.find(params[:id])
  end

  # POST /currencies
  # POST /currencies.json
  def create
    @currency = Currency.new(params[:currency])

    respond_to do |format|
      if @currency.save
        format.html { redirect_to @currency, notice: 'Currency was successfully created.' }
        format.json { render json: @currency, status: :created, location: @currency }
      else
        format.html { render action: "new" }
        format.json { render json: @currency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /currencies/1
  # PUT /currencies/1.json
  def update
    @currency = Currency.find(params[:id])

    respond_to do |format|
      if @currency.update_attributes(params[:currency])
        format.html { redirect_to @currency, notice: 'Currency was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @currency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /currencies/1
  # DELETE /currencies/1.json
  def destroy
    @currency = Currency.find(params[:id])
    @currency.update_attributes(:status => Currency::KEEP_IN_VIEW)
    
    respond_to do |format|
      format.html { redirect_to currencies_url, :notice => "This currency has moved to KIV." }
      format.json { head :no_content }
    end
  end
  
  def recover
    @currency = Currency.find(params[:id])
    @currency.update_attributes(:status => Currency::ACTIVE)
    
    respond_to do |format|
      format.html { redirect_to kiv_currencies_url, :notice => "This currency has moved out from KIV." }
      format.json { head :no_content }
    end
  end
end
