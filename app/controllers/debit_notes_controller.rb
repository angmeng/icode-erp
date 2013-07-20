class DebitNotesController < ApplicationController  
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  def index
    @search = DebitNote.search(params[:search])
    @debit_notes = DebitNote.db_active(@search).paginate(:page => params[:page])
  end
  
  def kiv
    @search = DebitNote.search(params[:search])
    @debit_notes = DebitNote.db_kiv(@search).paginate(:page => params[:page])
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
      redirect_to @debit_note, notice: "D/N No # #{@debit_note.debit_note_no} was successfully created."
    else
      flash[:alert] = @debit_note.errors.full_messages.join(", ")
      render action: "new"
    end
  end

  def update
    @debit_note = DebitNote.find(params[:id])
    if @debit_note.update_attributes(params[:debit_note])
      redirect_to @debit_note, notice: "D/N No # #{@debit_note.debit_note_no} was successfully updated."
    else
      flash[:alert] = @debit_note.errors.full_messages.join(", ")
      render action: "edit"
    end
  end

  def destroy
    @debit_note = DebitNote.find(params[:id])
    @debit_note.update_attributes!(:status_id => DataStatus::KEEP_IN_VIEW)
    redirect_to debit_notes_url, :notice => "D/N No # #{@debit_note.debit_note_no} has dropped to KIV."
  end
  
  def recover
    @debit_note = DebitNote.find(params[:id])
    @debit_note.update_attributes!(:status_id => DataStatus::ACTIVE)
    redirect_to kiv_debit_notes_url, :notice => "D/N No # #{@debit_note.debit_note_no} has recovered from KIV."
  end
end
