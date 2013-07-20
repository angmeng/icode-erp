class SteSupplierHistoriesController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  # GET /ste_supplier_histories
  # GET /ste_supplier_histories.json
  def index
    @ste_supplier_histories = SteSupplierHistory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ste_supplier_histories }
    end
  end

  # GET /ste_supplier_histories/1
  # GET /ste_supplier_histories/1.json
  def show
    @ste_supplier_history = SteSupplierHistory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ste_supplier_history }
    end
  end

  # GET /ste_supplier_histories/new
  # GET /ste_supplier_histories/new.json
  def new
    @ste_supplier_history = SteSupplierHistory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ste_supplier_history }
    end
  end

  # GET /ste_supplier_histories/1/edit
  def edit
    @ste_supplier_history = SteSupplierHistory.find(params[:id])
  end

  # POST /ste_supplier_histories
  # POST /ste_supplier_histories.json
  def create
    @ste_supplier_history = SteSupplierHistory.new(params[:ste_supplier_history])

    respond_to do |format|
      if @ste_supplier_history.save
        format.html { redirect_to @ste_supplier_history, notice: 'Ste supplier history was successfully created.' }
        format.json { render json: @ste_supplier_history, status: :created, location: @ste_supplier_history }
      else
        format.html { render action: "new" }
        format.json { render json: @ste_supplier_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ste_supplier_histories/1
  # PUT /ste_supplier_histories/1.json
  def update
    @ste_supplier_history = SteSupplierHistory.find(params[:id])

    respond_to do |format|
      if @ste_supplier_history.update_attributes(params[:ste_supplier_history])
        format.html { redirect_to @ste_supplier_history, notice: 'Ste supplier history was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ste_supplier_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ste_supplier_histories/1
  # DELETE /ste_supplier_histories/1.json
  def destroy
    @ste_supplier_history = SteSupplierHistory.find(params[:id])
    @ste_supplier_history.destroy

    respond_to do |format|
      format.html { redirect_to ste_supplier_histories_url }
      format.json { head :no_content }
    end
  end
end
