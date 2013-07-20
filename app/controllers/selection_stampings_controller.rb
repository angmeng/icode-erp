class SelectionStampingsController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  # GET /selection_stampings
  # GET /selection_stampings.json
  def index
    @selection_stampings = SelectionStamping.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @selection_stampings }
    end
  end

  # GET /selection_stampings/1
  # GET /selection_stampings/1.json
  def show
    @selection_stamping = SelectionStamping.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @selection_stamping }
    end
  end

  # GET /selection_stampings/new
  # GET /selection_stampings/new.json
  def new
    @selection_stamping = SelectionStamping.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @selection_stamping }
    end
  end

  # GET /selection_stampings/1/edit
  def edit
    @selection_stamping = SelectionStamping.find(params[:id])
  end

  # POST /selection_stampings
  # POST /selection_stampings.json
  def create
    @selection_stamping = SelectionStamping.new(params[:selection_stamping])

    respond_to do |format|
      if @selection_stamping.save
        format.html { redirect_to @selection_stamping, notice: 'Selection stamping was successfully created.' }
        format.json { render json: @selection_stamping, status: :created, location: @selection_stamping }
      else
        format.html { render action: "new" }
        format.json { render json: @selection_stamping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /selection_stampings/1
  # PUT /selection_stampings/1.json
  def update
    @selection_stamping = SelectionStamping.find(params[:id])

    respond_to do |format|
      if @selection_stamping.update_attributes(params[:selection_stamping])
        format.html { redirect_to @selection_stamping, notice: 'Selection stamping was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @selection_stamping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selection_stampings/1
  # DELETE /selection_stampings/1.json
  def destroy
    @selection_stamping = SelectionStamping.find(params[:id])
    @selection_stamping.destroy

    respond_to do |format|
      format.html { redirect_to selection_stampings_url }
      format.json { head :no_content }
    end
  end
end
