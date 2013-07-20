class IncomingRejectsController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  def index
    @search = IncomingReject.search(params[:search])
    @incoming_rejects = @search.paginate(:page => params[:page], :per_page => 10)
  end

  def show
    @incoming_reject = IncomingReject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @incoming_reject }
    end
  end

  def new
    @incoming_reject = IncomingReject.new
    @rn = ReceiveNote.all_vendor # for select vendor
    if params[:vendor_id].present?
      @rn_vendor_id = ReceiveNote.where(:trade_company_id => params[:vendor_id].to_i)
      @trade = TradeCompany.find(params[:vendor_id])
    end
  end

  # GET /incoming_rejects/1/edit
  def edit
    @incoming_reject = IncomingReject.find(params[:id])
  end

  # POST /incoming_rejects
  # POST /incoming_rejects.json
  def create
    @incoming_reject = IncomingReject.new(params[:incoming_reject])
    num = company.sn_incoming_reject_no.to_i + 1
    @incoming_reject.incoming_reject_no = num
    
    if params[:select_rn].present?
      @check, msg = IncomingReject.check_returned_qty(params[:select_rn], params[:returned_qty])
      if @check.present?
        if @incoming_reject.save
          company.update_attributes(:sn_incoming_reject_no => num)
#          IncomingReject.running_current_stock(@incoming_reject.purchase_requisition_item.product_id)
          redirect_to @incoming_reject, notice: 'Incoming reject was successfully created.'
        else
          flash[:alert] = @incoming_reject.errors.full_messages.join(",")
          render action: "new"
        end
      else
        flash[:alert] = msg
        redirect_to new_incoming_reject_path(:vendor_id => params[:vendor_id])
      end
    else
      flash[:alert] = "Please tick from checkboxes."
      redirect_to new_incoming_reject_path(:vendor_id => params[:vendor_id])
    end
    
   
#    if @incoming_reject.save
#      company.update_attributes(:sn_incoming_reject_no => @incoming_reject.incoming_reject_no)
##      IncomingReject.running_current_stock(@incoming_reject.purchase_requisition_item.product_id)
#      redirect_to @incoming_reject, notice: 'Incoming reject was successfully created.'
#    else
#      flash[:alert] = @incoming_reject.errors.full_messages.join(",")
#      render action: "new"
#    end

    
#
#    if params[:rn_checked].present?
#      if @receive_note.save
#        params[:rn_qty] ||= []
#        ReceiveNote.entry_value(params[:rn_qty], params[:rn_checked], @receive_note.id)
#        company.update_attributes(:sn_receive_note_no => a)
#        redirect_to receive_notes_path, notice: 'Receive note was successfully created.'
#      else
#        flash[:alert] = @receive_note.errors.full_messages.join(",")
#        @po_no = PurchaseOrder.find_company_id(params[:vendor_id]) if params[:vendor_id].present?
#        render action: "new"
#      end
#    else
#      flash[:alert] = "Please tick from checkboxes."
#      redirect_to new_receive_note_path(:vendor_id => params[:vendor_id])
#    end
  end
  
#  def create
#    
#    if @receive_note.save
#      Product.running_current_stock(@receive_note.purchase_requisition_item.product_id)
#      redirect_to @receive_note, notice: 'Receive note was successfully created.'
#    else
#      flash[:alert] = @receive_note.errors.full_messages.join(",")
#      render action: "index"
#    end
#  end

  # PUT /incoming_rejects/1
  # PUT /incoming_rejects/1.json
  def update
    @incoming_reject = IncomingReject.find(params[:id])

    respond_to do |format|
      if @incoming_reject.update_attributes(params[:incoming_reject])
        format.html { redirect_to @incoming_reject, notice: 'Incoming reject was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @incoming_reject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /incoming_rejects/1
  # DELETE /incoming_rejects/1.json
  def destroy
    @incoming_reject = IncomingReject.find(params[:id])
    @incoming_reject.destroy

    respond_to do |format|
      format.html { redirect_to incoming_rejects_url }
      format.json { head :no_content }
    end
  end
  
  def implement_product_id
    ReceiveNote.implement_product_id
  end
end
