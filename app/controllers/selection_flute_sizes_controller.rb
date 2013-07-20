class SelectionFluteSizesController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  # GET /selection_flute_sizes
  # GET /selection_flute_sizes.json
  def index
    @selection_flute_sizes = SelectionFluteSize.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @selection_flute_sizes }
    end
  end

  # GET /selection_flute_sizes/1
  # GET /selection_flute_sizes/1.json
  def show
    @selection_flute_size = SelectionFluteSize.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @selection_flute_size }
    end
  end

  # GET /selection_flute_sizes/new
  # GET /selection_flute_sizes/new.json
  def new
    @selection_flute_size = SelectionFluteSize.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @selection_flute_size }
    end
  end

  # GET /selection_flute_sizes/1/edit
  def edit
    @selection_flute_size = SelectionFluteSize.find(params[:id])
  end

  # POST /selection_flute_sizes
  # POST /selection_flute_sizes.json
  def create
    @selection_flute_size = SelectionFluteSize.new(params[:selection_flute_size])

    respond_to do |format|
      if @selection_flute_size.save
        format.html { redirect_to @selection_flute_size, notice: 'Selection flute size was successfully created.' }
        format.json { render json: @selection_flute_size, status: :created, location: @selection_flute_size }
      else
        format.html { render action: "new" }
        format.json { render json: @selection_flute_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /selection_flute_sizes/1
  # PUT /selection_flute_sizes/1.json
  def update
    @selection_flute_size = SelectionFluteSize.find(params[:id])

    respond_to do |format|
      if @selection_flute_size.update_attributes(params[:selection_flute_size])
        format.html { redirect_to @selection_flute_size, notice: 'Selection flute size was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @selection_flute_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selection_flute_sizes/1
  # DELETE /selection_flute_sizes/1.json
  def destroy
    @selection_flute_size = SelectionFluteSize.find(params[:id])
    @selection_flute_size.destroy

    respond_to do |format|
      format.html { redirect_to selection_flute_sizes_url }
      format.json { head :no_content }
    end
  end
end
