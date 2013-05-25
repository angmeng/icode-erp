class StatementOfAccountsController < ApplicationController
  before_filter :authenticate_user!
  layout "sheetbox", :only => [:index]
  
  def index
    @statement_of_accounts = StatementOfAccount.where{ (trade_company_id == 18) & ((fp == StatementOfAccount::NULL_PAYMENT) | (fp == StatementOfAccount::TEMP_PAYMENT)) }
    render :layout => false
  end
end
