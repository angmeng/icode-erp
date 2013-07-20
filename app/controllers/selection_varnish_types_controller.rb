class SelectionVarnishTypesController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  # GET /selection_varnish_types
  # GET /selection_varnish_types.json
  def index
    @selection_varnish_types = SelectionVarnishType.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @selection_varnish_types }
    end
  end

  # GET /selection_varnish_types/1
  # GET /selection_varnish_types/1.json
  def show
    @selection_varnish_type = SelectionVarnishType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @selection_varnish_type }
    end
  end

  # GET /selection_varnish_types/new
  # GET /selection_varnish_types/new.json
  def new
    @selection_varnish_type = SelectionVarnishType.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @selection_varnish_type }
    end
  end

  # GET /selection_varnish_types/1/edit
  def edit
    @selection_varnish_type = SelectionVarnishType.find(params[:id])
  end

  # POST /selection_varnish_types
  # POST /selection_varnish_types.json
  def create
    @selection_varnish_type = SelectionVarnishType.new(params[:selection_varnish_type])

    respond_to do |format|
      if @selection_varnish_type.save
        format.html { redirect_to @selection_varnish_type, notice: 'Selection varnish type was successfully created.' }
        format.json { render json: @selection_varnish_type, status: :created, location: @selection_varnish_type }
      else
        format.html { render action: "new" }
        format.json { render json: @selection_varnish_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /selection_varnish_types/1
  # PUT /selection_varnish_types/1.json
  def update
    @selection_varnish_type = SelectionVarnishType.find(params[:id])

    respond_to do |format|
      if @selection_varnish_type.update_attributes(params[:selection_varnish_type])
        format.html { redirect_to @selection_varnish_type, notice: 'Selection varnish type was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @selection_varnish_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selection_varnish_types/1
  # DELETE /selection_varnish_types/1.json
  def destroy
    @selection_varnish_type = SelectionVarnishType.find(params[:id])
    @selection_varnish_type.destroy

    respond_to do |format|
      format.html { redirect_to selection_varnish_types_url }
      format.json { head :no_content }
    end
  end
end
