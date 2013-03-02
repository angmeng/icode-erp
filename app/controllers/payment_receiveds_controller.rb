class PaymentReceivedsController < ApplicationController
  before_filter :authenticate_user!
  layout "sheetbox", :only => [:show, :new, :edit]
  
  def index
    @search = PaymentReceived.search(params[:search])
    @payment_receiveds = PaymentReceived.db_active(@search)
  end

  def kiv
    @search = PaymentReceived.search(params[:search])
    @payment_receiveds = PaymentReceived.db_kiv(@search)
  end
  
  def show
    @payment_received = PaymentReceived.find(params[:id])
  end

  def new
    @payment_received = PaymentReceived.new
  end

  def edit
    @payment_received = PaymentReceived.find(params[:id])
  end

  def create
    @payment_received = PaymentReceived.new(params[:payment_received])

    if @payment_received.save
      redirect_to @payment_received, notice: 'Payment Received was successfully created.'
    else
      flash[:alert] = @payment_received.errors.full_messages.join(", ")
      render action: "new"
    end
  end

  def update
    @payment_received = PaymentReceived.find(params[:id])

    respond_to do |format|
      if @payment_received.update_attributes(params[:payment_received])
        format.html { redirect_to @payment_received, notice: 'Payment received was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @payment_received.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @payment_received = PaymentReceived.find(params[:id])
    @payment_received.update_attributes!(:status_id => Status::KEEP_IN_VIEW)
    redirect_to payment_receiveds_url, :notice => "This payment received has dropped to KIV."
  end
  
  def recover
    @payment_received = PaymentReceived.find(params[:id])
    @payment_received.update_attributes!(:status_id => Status::ACTIVE)
    redirect_to kiv_payment_receiveds_url, :notice => "This payment received has recovered from KIV."
  end
end
