class ReceiveNotesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :implement_product_id
  before_filter :inventory_management_system, :except => [:show]
#  layout "sheetbox"

  def index
    @search = ReceiveNote.search(params[:search])
    @receive_notes = ReceiveNote.ordered(@search)
    @rn_updater = ReceiveNote.uniq_updater
    
    if user_is_admin?
      @receive_notes = @receive_notes.all
    else
      @receive_notes = @receive_notes.find_all_by_updated_by(current_user.id)
    end
  end

  def show
    @receive_note = ReceiveNote.find(params[:id])
    @poil = @receive_note.receive_note_items.first.purchase_order_item_line
  end

  def new
    @receive_note = ReceiveNote.new
    @search = PurchaseOrder.search(params[:search])
    @po_no = @search.order("po_no") 
  end
  
  def info
    @search = PurchaseOrder.search(params[:search])
    @po_no = @search.order("po_no")
  end

  def edit
    @receive_note = ReceiveNote.find(params[:id])
    @po_no = PurchaseOrder.find_company_id(@receive_note.trade_company_id)
    render :layout => 'sheetbox'
  end

  def create
    @receive_note = ReceiveNote.new(params[:receive_note])
    a = company.sn_receive_note_no.to_i
    @receive_note.receive_note_no = a + 1
    params[:rn_qty] ||= []

    if params[:rn_checked].present?
      @checking, msg = ReceiveNote.check_rn_qty(params[:rn_qty], params[:rn_checked])
      if @checking.present?
        if @receive_note.save
          company.update_attributes(:sn_receive_note_no => a + 1)
          ReceiveNote.entry_value(params[:rn_qty], params[:rn_checked], @receive_note.id.to_i)
          redirect_to new_receive_note_path, notice: 'Receive note was successfully created.'
        else
          flash[:alert] = @receive_note.errors.full_messages.join(",")
          rn_error_messages(@receive_note)
        end
      else
        flash[:alert] = msg
        rn_error_messages(@receive_note)
      end
    else
      flash[:alert] = "Please tick from checkboxes."
      rn_error_messages(@receive_note)
    end
  end
        
  def update
    @receive_note = ReceiveNote.find(params[:id])
    if @receive_note.update_attributes(params[:receive_note])
      flash[:notice] = 'Receive note was successfully updated.'
      render action: "edit"
    else
      flash[:alert] = @receive_note.errors.full_messages.join(",")
      render action: "edit"
    end
  end

  # DELETE /receive_notes/1
  # DELETE /receive_notes/1.json
  def destroy
    @receive_note = ReceiveNote.find(params[:id])
    @receive_note.destroy

    respond_to do |format|
      format.html { redirect_to receive_notes_url }
      format.json { head :no_content }
    end
  end
  
  def implement_product_id
    ReceiveNote.implement_product_id
  end
  
  def rn_error_messages(receive_note)
      if receive_note.trade_company_id.present?
        @search = PurchaseOrder.search(params[:search])
        @po_no = PurchaseOrder.find_company_id(receive_note.trade_company_id) 
      else
        @search = PurchaseOrder.search(params[:search])
      end
      render "new"
  end
  
  private
  
  def inventory_management_system
    role(ReceiveNote::ROLE)
  end
end
