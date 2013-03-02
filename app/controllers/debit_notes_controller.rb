class DebitNotesController < ApplicationController
  before_filter :authenticate_user!
  layout "sheetbox", :only => [:show, :new, :edit]
  
  def index
    @search = DebitNote.search(params[:search])
    @debit_notes = DebitNote.db_active(@search)
  end
  
  def kiv
    @search = DebitNote.search(params[:search])
    @debit_notes = DebitNote.db_kiv(@search)
  end

  def show
    @debit_note = DebitNote.find(params[:id])
  end

  def new
    @debit_note = DebitNote.new
  end

  def edit
    @debit_note = DebitNote.find(params[:id])
  end

  def create
    @debit_note = DebitNote.new(params[:debit_note])
    if @debit_note.save
       @debit_note.update_debit_thing(company)
      redirect_to @debit_note, notice: "D/No##{@debit_note.debit_note_no} was successfully created."
    else
      flash[:alert] = @debit_note.errors.full_messages.join(", ")
      render action: "new"
    end
  end

  def update
    @debit_note = DebitNote.find(params[:id])

    respond_to do |format|
      if @debit_note.update_attributes(params[:debit_note])
        format.html { redirect_to @debit_note, notice: 'Debit note was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @debit_note.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @debit_note = DebitNote.find(params[:id])
    @debit_note.update_attributes!(:status_id => Status::KEEP_IN_VIEW)
    redirect_to debit_notes_url, :notice => "D/N No##{@debit_note.debit_note_no} has dropped to KIV."
  end
  
  def recover
    @debit_note = DebitNote.find(params[:id])
    @debit_note.update_attributes!(:status_id => Status::ACTIVE)
    redirect_to kiv_debit_notes_url, :notice => "D/N No##{@debit_note.debit_note_no} has recovered from KIV."
  end
end
