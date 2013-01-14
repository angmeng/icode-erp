class ProductFieldsController < ApplicationController
  # GET /product_fields
  # GET /product_fields.json
  def index
    @product_fields = ProductField.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_fields }
    end
  end

  # GET /product_fields/1
  # GET /product_fields/1.json
  def show
    @product_field = ProductField.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_field }
    end
  end

  # GET /product_fields/new
  # GET /product_fields/new.json
  def new
    @product_field = ProductField.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_field }
    end
  end

  # GET /product_fields/1/edit
  def edit
    @product_field = ProductField.find(params[:id])
  end

  # POST /product_fields
  # POST /product_fields.json
  def create
    @product_field = ProductField.new(params[:product_field])

    respond_to do |format|
      if @product_field.save
        format.html { redirect_to @product_field, notice: 'Product field was successfully created.' }
        format.json { render json: @product_field, status: :created, location: @product_field }
      else
        format.html { render action: "new" }
        format.json { render json: @product_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_fields/1
  # PUT /product_fields/1.json
  def update
    @product_field = ProductField.find(params[:id])

    respond_to do |format|
      if @product_field.update_attributes(params[:product_field])
        format.html { redirect_to @product_field, notice: 'Product field was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_field.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_fields/1
  # DELETE /product_fields/1.json
  def destroy
    @product_field = ProductField.find(params[:id])
    @product_field.destroy

    respond_to do |format|
      format.html { redirect_to product_fields_url }
      format.json { head :no_content }
    end
  end
end
