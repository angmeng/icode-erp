class OutgoingRejectsController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  
  def index
    @outgoing_rejects = OutgoingReject.where(:status => Status::ACTIVE)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @outgoing_rejects }
    end
  end

  def show
    @outgoing_reject = OutgoingReject.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @outgoing_reject }
    end
  end

  def new
    @outgoing_reject = OutgoingReject.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @outgoing_reject }
    end
  end

  def edit
    @outgoing_reject = OutgoingReject.find(params[:id])
  end

  def create
    @outgoing_reject = OutgoingReject.new(params[:outgoing_reject])
    @outgoing_reject_items, msg = OutgoingReject.init_outgoing_reject_items(params[:received_qty], @outgoing_reject)
    respond_to do |format|
      if @outgoing_reject_items.present? && @outgoing_reject.save
        format.html { redirect_to @outgoing_reject, notice: "Outgoing Reject # #{@outgoing_reject.outgoing_reject_no} was successfully created." }
        format.json { render json: @outgoing_reject, status: :created, location: @outgoing_reject }
      else
        format.html { render action: "new" }
        format.json { render json: @outgoing_reject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /outgoing_rejects/1
  # PUT /outgoing_rejects/1.json
  def update
    @outgoing_reject = OutgoingReject.find(params[:id])

    respond_to do |format|
      if @outgoing_reject.update_attributes(params[:outgoing_reject])
        format.html { redirect_to @outgoing_reject, notice: 'Outgoing reject was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @outgoing_reject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /outgoing_rejects/1
  # DELETE /outgoing_rejects/1.json
  def destroy
    @outgoing_reject = OutgoingReject.find(params[:id])
    @outgoing_reject.destroy

    respond_to do |format|
      format.html { redirect_to outgoing_rejects_url }
      format.json { head :no_content }
    end
  end
end
