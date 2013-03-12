class ProductComboboxesController < ApplicationController
  before_filter :authenticate_user!
  # GET /product_comboboxes
  # GET /product_comboboxes.json
  def index
    @search             = ProductCombobox.search(params[:search])
    @product_comboboxes = @search.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_comboboxes }
    end
  end

  # GET /product_comboboxes/1
  # GET /product_comboboxes/1.json
  def show
    @product_combobox = ProductCombobox.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_combobox }
    end
  end

  # GET /product_comboboxes/new
  # GET /product_comboboxes/new.json
  def new
    @product_combobox = ProductCombobox.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_combobox }
    end
  end

  # GET /product_comboboxes/1/edit
  def edit
    @product_combobox = ProductCombobox.find(params[:id])
  end

  # POST /product_comboboxes
  # POST /product_comboboxes.json
  def create
    @product_combobox = ProductCombobox.new(params[:product_combobox])

    respond_to do |format|
      if @product_combobox.save
        format.html { redirect_to @product_combobox, notice: 'Product combobox was successfully created.' }
        format.json { render json: @product_combobox, status: :created, location: @product_combobox }
      else
        format.html { render action: "new" }
        format.json { render json: @product_combobox.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_comboboxes/1
  # PUT /product_comboboxes/1.json
  def update
    @product_combobox = ProductCombobox.find(params[:id])

    respond_to do |format|
      if @product_combobox.update_attributes(params[:product_combobox])
        format.html { redirect_to @product_combobox, notice: 'Product combobox was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_combobox.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_comboboxes/1
  # DELETE /product_comboboxes/1.json
  def destroy
    @product_combobox = ProductCombobox.find(params[:id])
    @product_combobox.destroy

    respond_to do |format|
      format.html { redirect_to product_comboboxes_url }
      format.json { head :no_content }
    end
  end
  
  # Non operation n Operation de description
  def supplier_product_description
    @product_combobox = ProductCombobox.db_active_both_operation
    arr_desc = ProductCombobox.put_description(@product_combobox)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: arr_desc }
    end
  end
end
