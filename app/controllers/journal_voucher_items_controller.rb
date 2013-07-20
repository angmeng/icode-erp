class JournalVoucherItemsController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  # GET /journal_voucher_items
  # GET /journal_voucher_items.json
  def index
    @journal_voucher_items = JournalVoucherItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @journal_voucher_items }
    end
  end

  # GET /journal_voucher_items/1
  # GET /journal_voucher_items/1.json
  def show
    @journal_voucher_item = JournalVoucherItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @journal_voucher_item }
    end
  end

  # GET /journal_voucher_items/new
  # GET /journal_voucher_items/new.json
  def new
    @journal_voucher_item = JournalVoucherItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @journal_voucher_item }
    end
  end

  # GET /journal_voucher_items/1/edit
  def edit
    @journal_voucher_item = JournalVoucherItem.find(params[:id])
  end

  # POST /journal_voucher_items
  # POST /journal_voucher_items.json
  def create
    @journal_voucher_item = JournalVoucherItem.new(params[:journal_voucher_item])

    respond_to do |format|
      if @journal_voucher_item.save
        format.html { redirect_to @journal_voucher_item, notice: 'Journal voucher item was successfully created.' }
        format.json { render json: @journal_voucher_item, status: :created, location: @journal_voucher_item }
      else
        format.html { render action: "new" }
        format.json { render json: @journal_voucher_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /journal_voucher_items/1
  # PUT /journal_voucher_items/1.json
  def update
    @journal_voucher_item = JournalVoucherItem.find(params[:id])

    respond_to do |format|
      if @journal_voucher_item.update_attributes(params[:journal_voucher_item])
        format.html { redirect_to @journal_voucher_item, notice: 'Journal voucher item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @journal_voucher_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /journal_voucher_items/1
  # DELETE /journal_voucher_items/1.json
  def destroy
    @journal_voucher_item = JournalVoucherItem.find(params[:id])
    @journal_voucher_item.destroy

    respond_to do |format|
      format.html { redirect_to journal_voucher_items_url }
      format.json { head :no_content }
    end
  end
end
