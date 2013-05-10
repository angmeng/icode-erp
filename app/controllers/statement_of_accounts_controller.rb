class StatementOfAccountsController < ApplicationController
  before_filter :authenticate_user!
  layout "sheetbox", :only => [:index]
  
  def index
    @statement_of_accounts = StatementOfAccount.where(:trade_company_id => params[:company_id], :fp => StatementOfAccount::NULL_PAYMENT)
    render :layout => false
  end
  
#  def index
#    @statement_of_accounts = StatementOfAccount.all
#
#    respond_to do |format|
#      format.html # index.html.erb
#      format.json { render json: @statement_of_accounts }
#    end
#  end
#
#  def show
#    @statement_of_account = StatementOfAccount.find(params[:id])
#
#    respond_to do |format|
#      format.html # show.html.erb
#      format.json { render json: @statement_of_account }
#    end
#  end
#
#  def new
#    @statement_of_account = StatementOfAccount.new
#
#    respond_to do |format|
#      format.html # new.html.erb
#      format.json { render json: @statement_of_account }
#    end
#  end
#
#  def edit
#    @statement_of_account = StatementOfAccount.find(params[:id])
#  end
#
#  def create
#    @statement_of_account = StatementOfAccount.new(params[:statement_of_account])
#
#    respond_to do |format|
#      if @statement_of_account.save
#        format.html { redirect_to @statement_of_account, notice: 'Statement of account was successfully created.' }
#        format.json { render json: @statement_of_account, status: :created, location: @statement_of_account }
#      else
#        format.html { render action: "new" }
#        format.json { render json: @statement_of_account.errors, status: :unprocessable_entity }
#      end
#    end
#  end
#
#  def update
#    @statement_of_account = StatementOfAccount.find(params[:id])
#
#    respond_to do |format|
#      if @statement_of_account.update_attributes(params[:statement_of_account])
#        format.html { redirect_to @statement_of_account, notice: 'Statement of account was successfully updated.' }
#        format.json { head :no_content }
#      else
#        format.html { render action: "edit" }
#        format.json { render json: @statement_of_account.errors, status: :unprocessable_entity }
#      end
#    end
#  end
#
#  def destroy
#    @statement_of_account = StatementOfAccount.find(params[:id])
#    @statement_of_account.destroy
#
#    respond_to do |format|
#      format.html { redirect_to statement_of_accounts_url }
#      format.json { head :no_content }
#    end
#  end
end
