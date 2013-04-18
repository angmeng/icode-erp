class StockOutsController < ApplicationController
  before_filter :authenticate_user!
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  
  def index
    @search = StockOut.search(params[:search])
    @stock_outs = StockOut.db_active(@search)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stock_outs }
    end
  end
  
  def kiv
    @search = StockOut.search(params[:search])
    @stock_outs = StockOut.db_kiv(@search)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @stock_outs }
    end
  end

  def show
    @stock_out = StockOut.find(params[:id])
  end

  def new
    @stock_out = StockOut.new
  end

  def edit
    @stock_out = StockOut.find(params[:id])
  end

  def create
    @stock_out = StockOut.new(params[:stock_out])
    if @stock_out.save
      company.update_attributes(:sn_transfer_slip_no => @stock_out.transfer_note_no)
      InventoryManagement.generate_stock_out(@stock_out, InventoryIssue.find_by_description("TRANSFER NOTE").id)
      redirect_to @stock_out, notice: "Transfer Note No # #{@stock_out.transfer_note_no} was successfully created."
    else
      flash[:alert] = @stock_out.errors.full_messages.join(", ")
      render action: "new"
    end
  end

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
  
  def destroy
    @stock_out = StockOut.find(params[:id])
    @stock_out.update_attributes!(:status => StockOut::KEEP_IN_VIEW)

    respond_to do |format|
      format.html { redirect_to stock_outs_url, :notice => "Transfer Note No # #{@stock_out.transfer_note_no} has dropped to KIV." }
      format.json { head :no_content }
    end
  end
  
  def recover
    @stock_out = StockOut.find(params[:id])
    @stock_out.update_attributes!(:status => StockOut::ACTIVE)

    respond_to do |format|
      format.html { redirect_to kiv_stock_outs_url, :notice => "Transfer Note No # #{@stock_out.transfer_note_no} has recovered from KIV." }
      format.json { head :no_content }
    end
  end
end
