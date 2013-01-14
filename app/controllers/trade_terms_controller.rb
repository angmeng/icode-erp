class TradeTermsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_director
  layout "sheetbox"
  
  # GET /trade_terms
  # GET /trade_terms.json
  def index
    @search = TradeTerm.search(params[:search])
    @trade_terms = TradeTerm.ordered_name(@search)
  end
  
  def kiv
    @search = TradeTerm.search(params[:search])
    @trade_terms = TradeTerm.ordered_name_kiv(@search)
  end

  # GET /trade_terms/1
  # GET /trade_terms/1.json
  def show
    @trade_term = TradeTerm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @trade_term }
    end
  end

  # GET /trade_terms/new
  # GET /trade_terms/new.json
  def new
    @trade_term = TradeTerm.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @trade_term }
    end
  end

  # GET /trade_terms/1/edit
  def edit
    @trade_term = TradeTerm.find(params[:id])
  end

  # POST /trade_terms
  # POST /trade_terms.json
  def create
    @trade_term = TradeTerm.new(params[:trade_term])

    respond_to do |format|
      if @trade_term.save
        format.html { redirect_to @trade_term, notice: 'Trade term was successfully created.' }
        format.json { render json: @trade_term, status: :created, location: @trade_term }
      else
        format.html { render action: "new" }
        format.json { render json: @trade_term.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trade_terms/1
  # PUT /trade_terms/1.json
  def update
    @trade_term = TradeTerm.find(params[:id])

    respond_to do |format|
      if @trade_term.update_attributes(params[:trade_term])
        format.html { redirect_to @trade_term, notice: 'Trade term was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @trade_term.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trade_terms/1
  # DELETE /trade_terms/1.json
  def destroy
    @trade_term = TradeTerm.find(params[:id])
    @trade_term.update_attributes(:status => TradeTerm::KEEP_IN_VIEW)

    respond_to do |format|
      format.html { redirect_to trade_terms_url, :notice => "This trade term has moved to KIV." }
      format.json { head :no_content }
    end
  end
  
  def recover
    @trade_term = TradeTerm.find(params[:id])
    @trade_term.update_attributes(:status => TradeTerm::ACTIVE)

    respond_to do |format|
      format.html { redirect_to kiv_trade_terms_url, :notice => "This trade term has moved out from KIV." }
      format.json { head :no_content }
    end
  end
end
