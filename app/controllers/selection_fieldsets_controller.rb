class SelectionFieldsetsController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  # GET /selection_fieldsets
  # GET /selection_fieldsets.json
  def index
    @selection_fieldsets = SelectionFieldset.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @selection_fieldsets }
    end
  end

  # GET /selection_fieldsets/1
  # GET /selection_fieldsets/1.json
  def show
    @selection_fieldset = SelectionFieldset.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @selection_fieldset }
    end
  end

  # GET /selection_fieldsets/new
  # GET /selection_fieldsets/new.json
  def new
    @selection_fieldset = SelectionFieldset.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @selection_fieldset }
    end
  end

  # GET /selection_fieldsets/1/edit
  def edit
    @selection_fieldset = SelectionFieldset.find(params[:id])
  end

  # POST /selection_fieldsets
  # POST /selection_fieldsets.json
  def create
    @selection_fieldset = SelectionFieldset.new(params[:selection_fieldset])

    respond_to do |format|
      if @selection_fieldset.save
        format.html { redirect_to @selection_fieldset, notice: 'Selection fieldset was successfully created.' }
        format.json { render json: @selection_fieldset, status: :created, location: @selection_fieldset }
      else
        format.html { render action: "new" }
        format.json { render json: @selection_fieldset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /selection_fieldsets/1
  # PUT /selection_fieldsets/1.json
  def update
    @selection_fieldset = SelectionFieldset.find(params[:id])

    respond_to do |format|
      if @selection_fieldset.update_attributes(params[:selection_fieldset])
        format.html { redirect_to @selection_fieldset, notice: 'Selection fieldset was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @selection_fieldset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selection_fieldsets/1
  # DELETE /selection_fieldsets/1.json
  def destroy
    @selection_fieldset = SelectionFieldset.find(params[:id])
    @selection_fieldset.destroy

    respond_to do |format|
      format.html { redirect_to selection_fieldsets_url }
      format.json { head :no_content }
    end
  end
end
