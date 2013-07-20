class JournalVouchersController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  def index
    @journal_vouchers = JournalVoucher.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @journal_vouchers }
    end
  end

  # GET /journal_vouchers/1
  # GET /journal_vouchers/1.json
  def show
    @journal_voucher = JournalVoucher.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @journal_voucher }
    end
  end

  # GET /journal_vouchers/new
  # GET /journal_vouchers/new.json
  def new
    @journal_voucher = JournalVoucher.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @journal_voucher }
    end
  end

  # GET /journal_vouchers/1/edit
  def edit
    @journal_voucher = JournalVoucher.find(params[:id])
  end

  # POST /journal_vouchers
  # POST /journal_vouchers.json
  def create
    @journal_voucher = JournalVoucher.new(params[:journal_voucher])

    respond_to do |format|
      if @journal_voucher.save
        format.html { redirect_to @journal_voucher, notice: 'Journal voucher was successfully created.' }
        format.json { render json: @journal_voucher, status: :created, location: @journal_voucher }
      else
        format.html { render action: "new" }
        format.json { render json: @journal_voucher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /journal_vouchers/1
  # PUT /journal_vouchers/1.json
  def update
    @journal_voucher = JournalVoucher.find(params[:id])

    respond_to do |format|
      if @journal_voucher.update_attributes(params[:journal_voucher])
        format.html { redirect_to @journal_voucher, notice: 'Journal voucher was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @journal_voucher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /journal_vouchers/1
  # DELETE /journal_vouchers/1.json
  def destroy
    @journal_voucher = JournalVoucher.find(params[:id])
    @journal_voucher.destroy

    respond_to do |format|
      format.html { redirect_to journal_vouchers_url }
      format.json { head :no_content }
    end
  end
end
