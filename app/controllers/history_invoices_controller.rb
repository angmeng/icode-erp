class HistoryInvoicesController < ApplicationController
  before_filter :authenticate_user!
  layout "sheetbox"

  # GET /history_invoices
  # GET /history_invoices.json
  def index
    @history_invoices = HistoryInvoice.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @history_invoices }
    end
  end

  # GET /history_invoices/1
  # GET /history_invoices/1.json
  # def show
  #   @history_invoice = HistoryInvoice.find(params[:id])

  #   respond_to do |format|
  #     format.html # show.html.erb
  #     format.json { render json: @history_invoice }
  #   end
  # end

  # GET /history_invoices/new
  # GET /history_invoices/new.json
  # def new
  #   @history_invoice = HistoryInvoice.new

  #   respond_to do |format|
  #     format.html # new.html.erb
  #     format.json { render json: @history_invoice }
  #   end
  # end

  # GET /history_invoices/1/edit
  # def edit
  #   @history_invoice = HistoryInvoice.find(params[:id])
  # end

  # POST /history_invoices
  # POST /history_invoices.json
  def create
    @history_invoice = HistoryInvoice.new(params[:history_invoice])

    respond_to do |format|
      if @history_invoice.save
        format.html { redirect_to @history_invoice, notice: 'History invoice was successfully created.' }
        format.json { render json: @history_invoice, status: :created, location: @history_invoice }
      else
        format.html { render action: "new" }
        format.json { render json: @history_invoice.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /history_invoices/1
  # PUT /history_invoices/1.json
  # def update
  #   @history_invoice = HistoryInvoice.find(params[:id])

  #   respond_to do |format|
  #     if @history_invoice.update_attributes(params[:history_invoice])
  #       format.html { redirect_to @history_invoice, notice: 'History invoice was successfully updated.' }
  #       format.json { head :no_content }
  #     else
  #       format.html { render action: "edit" }
  #       format.json { render json: @history_invoice.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /history_invoices/1
  # DELETE /history_invoices/1.json
  def destroy
    # @history_invoice = HistoryInvoice.find(params[:hi_ids])
    # @history_invoice.each do |history_invoice|
      history_invoice = HistoryInvoice.find(params[:id])
      history_invoice.destroy

    respond_to do |format|
      format.html { redirect_to history_invoices_url }
      format.json { head :no_content }
   
   end
  end
end
