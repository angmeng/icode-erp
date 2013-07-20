class StatementOfAccountsController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  
  def index
#    @statement_of_accounts = StatementOfAccount.where("trade_company_id = ? AND ((fp = ? OR fp = ?))", params[:company_id], StatementOfAccount::NULL_PAYMENT, StatementOfAccount::TEMP_PAYMENT) 
    @statement_of_accounts = StatementOfAccount.where("status = ?", StatementOfAccount::ACTIVE)
  end
  
  def kiv
    @statement_of_accounts = StatementOfAccount.where("status = ?", StatementOfAccount::KIV)
  end
  
  def new
    @statement_of_account = StatementOfAccount.new
  end
  
  def edit
    @statement_of_account = StatementOfAccount.find(params[:id])
  end
  
  def create
    @statement_of_account = StatementOfAccount.new(params[:statement_of_account])
    if @statement_of_account.save
      if params[:save_and_new_balance]
        redirect_to new_statement_of_account_path, :notice => "The balance was created successfully."
      else
        redirect_to @statement_of_account, :notice => "The balance was created successfully."
      end
    else
      flash[:alert] = @statement_of_account.errors.full_messages.join(", ")
      render 'new'
    end
  end
  
  def update
    @statement_of_account = StatementOfAccount.find(params[:id])
    if @statement_of_account.update_attributes(params[:statement_of_account])
      redirect_to @statement_of_account, :notice => "Update Successfully."
    else
      render "edit"
    end
  end
  
  def destroy
    @statement_of_account = StatementOfAccount.find(params[:id])
#    @statement_of_account.update_attributes(:status => StatementOfAccount::KIV)
    @statement_of_account.destroy
    redirect_to statement_of_accounts_path, :notice => "This statement has deleted."
  end
  
  def show
    @statement_of_account = StatementOfAccount.find(params[:id])
  end
end