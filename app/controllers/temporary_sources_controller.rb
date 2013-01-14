class TemporarySourcesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :is_director
  # GET /temporary_sources
  # GET /temporary_sources.json
  def index
    @temporary_sources = TemporarySource.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @temporary_sources }
    end
  end

  # GET /temporary_sources/1
  # GET /temporary_sources/1.json
  def show
    @temporary_source = TemporarySource.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @temporary_source }
    end
  end

  # GET /temporary_sources/new
  # GET /temporary_sources/new.json
  def new
    @temporary_source = TemporarySource.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @temporary_source }
    end
  end

  # GET /temporary_sources/1/edit
  def edit
    @temporary_source = TemporarySource.find(params[:id])
  end

  # POST /temporary_sources
  # POST /temporary_sources.json
  def create
    @temporary_source = TemporarySource.new(params[:temporary_source])

    respond_to do |format|
      if @temporary_source.save
        format.html { redirect_to @temporary_source, notice: 'Temporary source was successfully created.' }
        format.json { render json: @temporary_source, status: :created, location: @temporary_source }
      else
        format.html { render action: "new" }
        format.json { render json: @temporary_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /temporary_sources/1
  # PUT /temporary_sources/1.json
  def update
    @temporary_source = TemporarySource.find(params[:id])

    respond_to do |format|
      if @temporary_source.update_attributes(params[:temporary_source])
        format.html { redirect_to @temporary_source, notice: 'Temporary source was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @temporary_source.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /temporary_sources/1
  # DELETE /temporary_sources/1.json
  def destroy
    @temporary_source = TemporarySource.find(params[:id])
    @temporary_source.destroy

    respond_to do |format|
      format.html { redirect_to temporary_sources_url }
      format.json { head :no_content }
    end
  end
end
