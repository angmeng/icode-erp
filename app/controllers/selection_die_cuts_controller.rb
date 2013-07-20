class SelectionDieCutsController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  # GET /selection_die_cuts
  # GET /selection_die_cuts.json
  def index
    @selection_die_cuts = SelectionDieCut.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @selection_die_cuts }
    end
  end

  # GET /selection_die_cuts/1
  # GET /selection_die_cuts/1.json
  def show
    @selection_die_cut = SelectionDieCut.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @selection_die_cut }
    end
  end

  # GET /selection_die_cuts/new
  # GET /selection_die_cuts/new.json
  def new
    @selection_die_cut = SelectionDieCut.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @selection_die_cut }
    end
  end

  # GET /selection_die_cuts/1/edit
  def edit
    @selection_die_cut = SelectionDieCut.find(params[:id])
  end

  # POST /selection_die_cuts
  # POST /selection_die_cuts.json
  def create
    @selection_die_cut = SelectionDieCut.new(params[:selection_die_cut])

    respond_to do |format|
      if @selection_die_cut.save
        format.html { redirect_to @selection_die_cut, notice: 'Selection die cut was successfully created.' }
        format.json { render json: @selection_die_cut, status: :created, location: @selection_die_cut }
      else
        format.html { render action: "new" }
        format.json { render json: @selection_die_cut.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /selection_die_cuts/1
  # PUT /selection_die_cuts/1.json
  def update
    @selection_die_cut = SelectionDieCut.find(params[:id])

    respond_to do |format|
      if @selection_die_cut.update_attributes(params[:selection_die_cut])
        format.html { redirect_to @selection_die_cut, notice: 'Selection die cut was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @selection_die_cut.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /selection_die_cuts/1
  # DELETE /selection_die_cuts/1.json
  def destroy
    @selection_die_cut = SelectionDieCut.find(params[:id])
    @selection_die_cut.destroy

    respond_to do |format|
      format.html { redirect_to selection_die_cuts_url }
      format.json { head :no_content }
    end
  end
end
