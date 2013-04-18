class ReceiveNoteItemsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @receive_note_items = ReceiveNoteItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @receive_note_items }
    end
  end

  def show
    @receive_note_item = ReceiveNoteItem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @receive_note_item }
    end
  end

  def new
    @receive_note_item = ReceiveNoteItem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @receive_note_item }
    end
  end

  def edit
    @receive_note_item = ReceiveNoteItem.find(params[:id])
  end

  def create
    @receive_note_item = ReceiveNoteItem.new(params[:receive_note_item])

    respond_to do |format|
      if @receive_note_item.save
        format.html { redirect_to @receive_note_item, notice: 'Receive note item was successfully created.' }
        format.json { render json: @receive_note_item, status: :created, location: @receive_note_item }
      else
        format.html { render action: "new" }
        format.json { render json: @receive_note_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @receive_note_item = ReceiveNoteItem.find(params[:id])

    respond_to do |format|
      if @receive_note_item.update_attributes(params[:receive_note_item])
        format.html { redirect_to @receive_note_item, notice: 'Receive note item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @receive_note_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @receive_note_item = ReceiveNoteItem.find(params[:id])
    @receive_note_item.destroy

    respond_to do |format|
      format.html { redirect_to receive_note_items_url }
      format.json { head :no_content }
    end
  end
end
