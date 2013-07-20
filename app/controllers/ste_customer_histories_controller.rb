class SteCustomerHistoriesController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  # GET /ste_customer_histories
  # GET /ste_customer_histories.json
  def index
    @ste_customer_histories = SteCustomerHistory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ste_customer_histories }
    end
  end

  # GET /ste_customer_histories/1
  # GET /ste_customer_histories/1.json
  def show
    @ste_customer_history = SteCustomerHistory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ste_customer_history }
    end
  end

  # GET /ste_customer_histories/new
  # GET /ste_customer_histories/new.json
  def new
    @ste_customer_history = SteCustomerHistory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ste_customer_history }
    end
  end

  # GET /ste_customer_histories/1/edit
  def edit
    @ste_customer_history = SteCustomerHistory.find(params[:id])
  end

  # POST /ste_customer_histories
  # POST /ste_customer_histories.json
  def create
    @ste_customer_history = SteCustomerHistory.new(params[:ste_customer_history])

    respond_to do |format|
      if @ste_customer_history.save
        format.html { redirect_to @ste_customer_history, notice: 'Ste customer history was successfully created.' }
        format.json { render json: @ste_customer_history, status: :created, location: @ste_customer_history }
      else
        format.html { render action: "new" }
        format.json { render json: @ste_customer_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ste_customer_histories/1
  # PUT /ste_customer_histories/1.json
  def update
    @ste_customer_history = SteCustomerHistory.find(params[:id])

    respond_to do |format|
      if @ste_customer_history.update_attributes(params[:ste_customer_history])
        format.html { redirect_to @ste_customer_history, notice: 'Ste customer history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ste_customer_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ste_customer_histories/1
  # DELETE /ste_customer_histories/1.json
  def destroy
    @ste_customer_history = SteCustomerHistory.find(params[:id])
    @ste_customer_history.destroy

    respond_to do |format|
      format.html { redirect_to ste_customer_histories_url }
      format.json { head :no_content }
    end
  end
end
