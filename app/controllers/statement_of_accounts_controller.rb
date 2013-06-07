class StatementOfAccountsController < ApplicationController
  before_filter :authenticate_user!
  layout "sheetbox", :only => [:index]
  
  def index
    @statement_of_accounts = StatementOfAccount.where("trade_company_id = ? AND ((fp = ? OR fp = ?))", params[:company_id], StatementOfAccount::NULL_PAYMENT, StatementOfAccount::TEMP_PAYMENT) 
    render :layout => false
  end
end