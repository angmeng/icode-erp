class FilmNumbersController < ApplicationController
  # GET /film_numbers
  # GET /film_numbers.json
  def index
    @film_numbers = FilmNumber.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @film_numbers }
    end
  end

  # GET /film_numbers/1
  # GET /film_numbers/1.json
  def show
    @film_number = FilmNumber.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @film_number }
    end
  end

  # GET /film_numbers/new
  # GET /film_numbers/new.json
  def new
    @film_number = FilmNumber.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @film_number }
    end
  end

  # GET /film_numbers/1/edit
  def edit
    @film_number = FilmNumber.find(params[:id])
  end

  # POST /film_numbers
  # POST /film_numbers.json
  def create
    @film_number = FilmNumber.new(params[:film_number])

    respond_to do |format|
      if @film_number.save
        format.html { redirect_to @film_number, notice: 'Film number was successfully created.' }
        format.json { render json: @film_number, status: :created, location: @film_number }
      else
        format.html { render action: "new" }
        format.json { render json: @film_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /film_numbers/1
  # PUT /film_numbers/1.json
  def update
    @film_number = FilmNumber.find(params[:id])

    respond_to do |format|
      if @film_number.update_attributes(params[:film_number])
        format.html { redirect_to @film_number, notice: 'Film number was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @film_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /film_numbers/1
  # DELETE /film_numbers/1.json
  def destroy
    @film_number = FilmNumber.find(params[:id])
    @film_number.destroy

    respond_to do |format|
      format.html { redirect_to film_numbers_url }
      format.json { head :no_content }
    end
  end
end
