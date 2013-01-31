class StockOutsController < ApplicationController
  # GET /stock_outs
  # GET /stock_outs.json

  layout "sheetbox"
  
  def index
    @stock_outs = StockOut.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stock_outs }
    end
  end

  # GET /stock_outs/1
  # GET /stock_outs/1.json
  def show
    @stock_out = StockOut.find(params[:id])
<<<<<<< HEAD

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @stock_out }
    end
=======
#    respond_to do |format|
#      format.html # show.html.erb
#      format.json { render json: @stock_out }
#    end
>>>>>>> 4127eef4ca7305cceee9cbb695e58987c99b7269
  end

  # GET /stock_outs/new
  # GET /stock_outs/new.json
  def new
    @stock_out = StockOut.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @stock_out }
    end
  end

  # GET /stock_outs/1/edit
  def edit
    @stock_out = StockOut.find(params[:id])
  end

  # POST /stock_outs
  # POST /stock_outs.json
  def create
    @stock_out = StockOut.new(params[:stock_out])
<<<<<<< HEAD

    respond_to do |format|
      if @stock_out.save
        format.html { redirect_to @stock_out, notice: 'Stock out was successfully created.' }
        format.json { render json: @stock_out, status: :created, location: @stock_out }
      else
        format.html { render action: "new" }
=======
    a = company.sn_transfer_slip_no.to_i + 1
    @stock_out.transfer_note_no = a
    respond_to do |format|
      if @stock_out.save
        format.html { 
          company.update_attributes(:sn_transfer_slip_no => a)
          redirect_to @stock_out, notice: 'Stock out was successfully created.' }
        format.json { render json: @stock_out, status: :created, location: @stock_out }
      else
        format.html { 
          flash[:alert] = @stock_out.errors.full_messages.join(", ")
          render action: "new" 
          }
>>>>>>> 4127eef4ca7305cceee9cbb695e58987c99b7269
        format.json { render json: @stock_out.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /stock_outs/1
  # PUT /stock_outs/1.json
  def update
    @stock_out = StockOut.find(params[:id])

    respond_to do |format|
      if @stock_out.update_attributes(params[:stock_out])
        format.html { redirect_to @stock_out, notice: 'Stock out was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @stock_out.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /stock_outs/1
  # DELETE /stock_outs/1.json
  def destroy
    @stock_out = StockOut.find(params[:id])
    @stock_out.destroy

    respond_to do |format|
      format.html { redirect_to stock_outs_url }
      format.json { head :no_content }
    end
  end
end
