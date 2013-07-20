class SelectionDieCutMouldsController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  # GET /selection_die_cut_moulds
  # GET /selection_die_cut_moulds.json
  def index
    @selection_die_cut_moulds = SelectionDieCutMould.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @selection_die_cut_moulds }
    end
  end

  # GET /selection_die_cut_moulds/1
  # GET /selection_die_cut_moulds/1.json
  def show
    @selection_die_cut_mould = SelectionDieCutMould.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @selection_die_cut_mould }
    end
  end

  # GET /selection_die_cut_moulds/new
  # GET /selection_die_cut_moulds/new.json
  def new
    @selection_die_cut_mould = SelectionDieCutMould.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @selection_die_cut_mould }
    end
  end

  # GET /selection_die_cut_moulds/1/edit
  def edit
    @selection_die_cut_mould = SelectionDieCutMould.find(params[:id])
  end

  # POST /selection_die_cut_moulds
  # POST /selection_die_cut_moulds.json
  def create
    @selection_die_cut_mould = SelectionDieCutMould.new(params[:selection_die_cut_mould])

    respond_to do |format|
      if @selection_die_cut_mould.save
        format.html { redirect_to @selection_die_cut_mould, notice: 'Selection die cut mould was successfully created.' }
        format.json { render json: @selection_die_cut_mould, status: :created, location: @selection_die_cut_mould }
      else
        format.html { render action: "new" }
        format.json { render json: @selection_die_cut_mould.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /selection_die_cut_moulds/1
  # PUT /selection_die_cut_moulds/1.json
  def update
    @selection_die_cut_mould = SelectionDieCutMould.find(params[:id])

    respond_to do |format|
      if @selection_die_cut_mould.update_attributes(params[:selection_die_cut_mould])
        format.html { redirect_to @selection_die_cut_mould, notice: 'Selection die cut mould was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @selection_die_cut_mould.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selection_die_cut_moulds/1
  # DELETE /selection_die_cut_moulds/1.json
  def destroy
    @selection_die_cut_mould = SelectionDieCutMould.find(params[:id])
    @selection_die_cut_mould.destroy

    respond_to do |format|
      format.html { redirect_to selection_die_cut_moulds_url }
      format.json { head :no_content }
    end
  end
end
