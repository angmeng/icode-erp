class SequentsController < ApplicationController
  before_filter :authenticate_user!
  # GET /sequents
  # GET /sequents.json
  def index
    @sequents = Sequent.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @sequents }
    end
  end

  # GET /sequents/1
  # GET /sequents/1.json
  def show
    @sequent = Sequent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sequent }
    end
  end

  # GET /sequents/new
  # GET /sequents/new.json
  def new
    @sequent = Sequent.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @sequent }
    end
  end

  # GET /sequents/1/edit
  def edit
    @sequent = Sequent.find(params[:id])
  end

  # POST /sequents
  # POST /sequents.json
  def create
    @sequent = Sequent.new(params[:sequent])

    respond_to do |format|
      if @sequent.save
        format.html { redirect_to @sequent, notice: 'Sequent was successfully created.' }
        format.json { render json: @sequent, status: :created, location: @sequent }
      else
        format.html { render action: "new" }
        format.json { render json: @sequent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /sequents/1
  # PUT /sequents/1.json
  def update
    @sequent = Sequent.find(params[:id])

    respond_to do |format|
      if @sequent.update_attributes(params[:sequent])
        format.html { redirect_to @sequent, notice: 'Sequent was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sequent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sequents/1
  # DELETE /sequents/1.json
  def destroy
    @sequent = Sequent.find(params[:id])
    @sequent.destroy

    respond_to do |format|
      format.html { redirect_to sequents_url }
      format.json { head :no_content }
    end
  end
end
