class SelectionStampingSizesController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  # GET /selection_stamping_sizes
  # GET /selection_stamping_sizes.json
  def index
    @selection_stamping_sizes = SelectionStampingSize.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @selection_stamping_sizes }
    end
  end

  # GET /selection_stamping_sizes/1
  # GET /selection_stamping_sizes/1.json
  def show
    @selection_stamping_size = SelectionStampingSize.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @selection_stamping_size }
    end
  end

  # GET /selection_stamping_sizes/new
  # GET /selection_stamping_sizes/new.json
  def new
    @selection_stamping_size = SelectionStampingSize.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @selection_stamping_size }
    end
  end

  # GET /selection_stamping_sizes/1/edit
  def edit
    @selection_stamping_size = SelectionStampingSize.find(params[:id])
  end

  # POST /selection_stamping_sizes
  # POST /selection_stamping_sizes.json
  def create
    @selection_stamping_size = SelectionStampingSize.new(params[:selection_stamping_size])

    respond_to do |format|
      if @selection_stamping_size.save
        format.html { redirect_to @selection_stamping_size, notice: 'Selection stamping size was successfully created.' }
        format.json { render json: @selection_stamping_size, status: :created, location: @selection_stamping_size }
      else
        format.html { render action: "new" }
        format.json { render json: @selection_stamping_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /selection_stamping_sizes/1
  # PUT /selection_stamping_sizes/1.json
  def update
    @selection_stamping_size = SelectionStampingSize.find(params[:id])

    respond_to do |format|
      if @selection_stamping_size.update_attributes(params[:selection_stamping_size])
        format.html { redirect_to @selection_stamping_size, notice: 'Selection stamping size was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @selection_stamping_size.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selection_stamping_sizes/1
  # DELETE /selection_stamping_sizes/1.json
  def destroy
    @selection_stamping_size = SelectionStampingSize.find(params[:id])
    @selection_stamping_size.destroy

    respond_to do |format|
      format.html { redirect_to selection_stamping_sizes_url }
      format.json { head :no_content }
    end
  end
end
