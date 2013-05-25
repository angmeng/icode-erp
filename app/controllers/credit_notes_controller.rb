class CreditNotesController < ApplicationController
  before_filter :authenticate_user!
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update, :selection_cn, :show_cn, :update_cn]
 
  def index
    @search = CreditNote.search(params[:search])
    @credit_notes = CreditNote.db_active(@search).paginate(:page => params[:page])
  end

  def kiv
    @search = CreditNote.search(params[:search])
    @credit_notes = CreditNote.db_kiv(@search).paginate(:page => params[:page])
  end
  
  def selection_cn
    @statement = StatementOfAccount.where(:trade_company_id => params[:trade_company_id], :transaction_type => StatementOfAccount::CREDIT_NOTE, :fp => StatementOfAccount::NULL_PAYMENT)
  end
  
  def update_cn
    @statement = StatementOfAccount.find(params[:choose_cn])
    if @statement.present?
      @statement.each { |st| st.update_attributes(:fp => StatementOfAccount::TEMP_PAYMENT) }
      redirect_to show_cn_credit_notes_path(:trade_company_id => @statement.first.trade_company_id), :notice => "Updated successfully."
    else
      flash[:alert] = "Please select the checkboxes."
      render "selection_cn"
    end
  end
  
  def show_cn
    @statements = StatementOfAccount.where(:trade_company_id => 18, :transaction_type => StatementOfAccount::CREDIT_NOTE, :fp => StatementOfAccount::TEMP_PAYMENT)
#    render :text => @statements.to_json
  end
  
  def show
    @credit_note = CreditNote.find(params[:id])
  end

  def new
    @credit_note = CreditNote.new
  end

  def edit
    @credit_note = CreditNote.find(params[:id])
  end

  def create
    @credit_note = CreditNote.new(params[:credit_note])
    if @credit_note.save
      @credit_note.update_credit_thing(company)
      redirect_to @credit_note, notice: "CN No##{@credit_note.credit_note_no} was successfully created."
    else
      flash[:alert] = @credit_note.errors.full_messages.join(", ")
      render action: "new"
    end
  end

  def update
    @credit_note = CreditNote.find(params[:id])
    if @credit_note.update_attributes(params[:credit_note])
      redirect_to @credit_note, notice: "Credit Note #{@credit_note.credit_note_no} was successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @credit_note = CreditNote.find(params[:id])
    @credit_note.update_attributes!(:status_id => DataStatus::KEEP_IN_VIEW)
    redirect_to credit_notes_url, :notice => "C/N No # #{@credit_note.credit_note_no} has dropped to KIV."
  end
  
  def recover
    @credit_note = CreditNote.find(params[:id])
    @credit_note.update_attributes!(:status_id => DataStatus::ACTIVE)
    redirect_to kiv_credit_notes_url, :notice => "C/N No # #{@credit_note.credit_note_no} has recovered from KIV."
  end
end