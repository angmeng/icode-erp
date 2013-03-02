class CreditNotesController < ApplicationController
  before_filter :authenticate_user!
  layout "sheetbox", :only => [:show, :new, :edit]
 
  def index
    @search = CreditNote.search(params[:search])
    @credit_notes = CreditNote.db_active(@search)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @credit_notes }
    end
  end

  def kiv
    @search = CreditNote.search(params[:search])
    @credit_notes = CreditNote.db_kiv(@search)
  end
  
  def show
    @credit_note = CreditNote.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @credit_note }
    end
  end

  def new
    @credit_note = CreditNote.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @credit_note }
    end
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

    respond_to do |format|
      if @credit_note.update_attributes(params[:credit_note])
        format.html { redirect_to @credit_note, notice: 'Credit note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @credit_note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @credit_note = CreditNote.find(params[:id])
    @credit_note.update_attributes!(:status_id => Status::KEEP_IN_VIEW)
    redirect_to credit_notes_url, :notice => "C/N No##{@credit_note.credit_note_no} has dropped to KIV."
  end
  
  def recover
    @credit_note = CreditNote.find(params[:id])
    @credit_note.update_attributes!(:status_id => Status::ACTIVE)
    redirect_to kiv_credit_notes_url, :notice => "C/N No##{@credit_note.credit_note_no} has recovered from KIV."
  end
end