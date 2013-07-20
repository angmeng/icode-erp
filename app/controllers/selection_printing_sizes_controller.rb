class SelectionPrintingSizesController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  # GET /selection_printing_sizes
  # GET /selection_printing_sizes.json
  def index
    @selection_printing_sizes = SelectionPrintingSize.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @selection_printing_sizes }
    end
  end

  # GET /selection_printing_sizes/1
  # GET /selection_printing_sizes/1.json
  def show
    @selection_printing_size = SelectionPrintingSize.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @selection_printing_size }
    end
  end

  # GET /selection_printing_sizes/new
  # GET /selection_printing_sizes/new.json
  def new
    @selection_printing_size = SelectionPrintingSize.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @selection_printing_size }
    end
  end

  # GET /selection_printing_sizes/1/edit
  def edit
    @selection_printing_size = SelectionPrintingSize.find(params[:id])
  end

  # POST /selection_printing_sizes
  # POST /selection_printing_sizes.json
  def create
    @selection_printing_size = SelectionPrintingSize.new(params[:selection_printing_size])

    respond_to do |format|
      if @selection_printing_size.save
        format.html { redirect_to @selection_printing_size, notice: 'Selection printing size was successfully created.' }
        format.json { render json: @selection_printing_size, status: :created, location: @selection_printing_size }
      else
        format.html { render action: "new" }
        format.json { render json: @selection_printing_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /selection_printing_sizes/1
  # PUT /selection_printing_sizes/1.json
  def update
    @selection_printing_size = SelectionPrintingSize.find(params[:id])

    respond_to do |format|
      if @selection_printing_size.update_attributes(params[:selection_printing_size])
        format.html { redirect_to @selection_printing_size, notice: 'Selection printing size was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @selection_printing_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selection_printing_sizes/1
  # DELETE /selection_printing_sizes/1.json
  def destroy
    @selection_printing_size = SelectionPrintingSize.find(params[:id])
    @selection_printing_size.destroy

    respond_to do |format|
      format.html { redirect_to selection_printing_sizes_url }
      format.json { head :no_content }
    end
  end
end
