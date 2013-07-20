class SelectionGlueingsController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  # GET /selection_glueings
  # GET /selection_glueings.json
  def index
    @selection_glueings = SelectionGlueing.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @selection_glueings }
    end
  end

  # GET /selection_glueings/1
  # GET /selection_glueings/1.json
  def show
    @selection_glueing = SelectionGlueing.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @selection_glueing }
    end
  end

  # GET /selection_glueings/new
  # GET /selection_glueings/new.json
  def new
    @selection_glueing = SelectionGlueing.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @selection_glueing }
    end
  end

  # GET /selection_glueings/1/edit
  def edit
    @selection_glueing = SelectionGlueing.find(params[:id])
  end

  # POST /selection_glueings
  # POST /selection_glueings.json
  def create
    @selection_glueing = SelectionGlueing.new(params[:selection_glueing])

    respond_to do |format|
      if @selection_glueing.save
        format.html { redirect_to @selection_glueing, notice: 'Selection glueing was successfully created.' }
        format.json { render json: @selection_glueing, status: :created, location: @selection_glueing }
      else
        format.html { render action: "new" }
        format.json { render json: @selection_glueing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /selection_glueings/1
  # PUT /selection_glueings/1.json
  def update
    @selection_glueing = SelectionGlueing.find(params[:id])

    respond_to do |format|
      if @selection_glueing.update_attributes(params[:selection_glueing])
        format.html { redirect_to @selection_glueing, notice: 'Selection glueing was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @selection_glueing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selection_glueings/1
  # DELETE /selection_glueings/1.json
  def destroy
    @selection_glueing = SelectionGlueing.find(params[:id])
    @selection_glueing.destroy

    respond_to do |format|
      format.html { redirect_to selection_glueings_url }
      format.json { head :no_content }
    end
  end
end
