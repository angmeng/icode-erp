class ReceiptsController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  def index
    @search = Receipt.search(params[:search])
    @receipts = Receipt.db_active(@search).paginate(:page => params[:page])
    @statements = StatementOfAccount.where(:fp => StatementOfAccount::NULL_PAYMENT)
  end
  
  def kiv
    @search = Receipt.search(params[:search])
    @receipts = Receipt.db_kiv(@search).paginate(:page => params[:page])
  end

  def show
    @receipt = Receipt.find(params[:id])
  end

  def new
    @receipt = Receipt.new
  end

  def edit
    @receipt = Receipt.find(params[:id])
    @statement_of_accounts = @receipt.statement_of_accounts
  end

  def create
    @receipt = Receipt.new(params[:receipt])
    if params[:datarow].present?
      if @receipt.save
        AccountManagement.manage_receipts(params[:datarow], @receipt)
        @receipt.update_to_statement(company)
        redirect_to @receipt, notice: "Receipt No # #{@receipt.receipt_no} was successfully created."
      else
        flash[:alert] = @receipt.errors.full_messages.join(", ")
        render action: "new"
      end
    else
      flase[:alert] = "Please assign your receipt assignment on the tab."
      render action: "new"
    end
  end

  def update
    @receipt = Receipt.find(params[:id])
    if @receipt.update_attributes(params[:receipt])
      AccountManagement.manage_edit_receipts(params[:datarow], @receipt)
      redirect_to @receipt, notice: "Receipt No # #{@receipt.receipt_no} was successfully updated."
    else
      flash[:alert] = @receipt.errors.full_messages.join(", ")
      render action: "edit"
    end
  end

  def destroy
    @receipt = Receipt.find(params[:id])
    @receipt.update_attributes!(:status_id => DataStatus::KEEP_IN_VIEW)
    redirect_to receipts_url, notice: "Receipt No # #{@receipt.receipt_no} was dropped to KIV."
  end
  
  def recover
    @receipt = Receipt.find(params[:id])
    @receipt.update_attributes!(:status_id => DataStatus::ACTIVE)
    redirect_to kiv_receipts_url, :notice => "Receipt No # #{@receipt.receipt_no} has recovered from KIV."
  end
end
