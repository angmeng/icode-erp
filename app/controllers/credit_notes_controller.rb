class CreditNotesController < ApplicationController
  before_filter :authenticate_user!
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
 
  def index
    @search = CreditNote.search(params[:search])
    @credit_notes = CreditNote.db_active(@search).paginate(:page => params[:page])
  end

  def kiv
    @search = CreditNote.search(params[:search])
    @credit_notes = CreditNote.db_kiv(@search).paginate(:page => params[:page])
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