class PaymentReceivedsController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  def index
    @search = PaymentReceived.search(params[:search])
    @payment_receiveds = PaymentReceived.db_active(@search).paginate(:page => params[:page])
  end

  def kiv
    @search = PaymentReceived.search(params[:search])
    @payment_receiveds = PaymentReceived.db_kiv(@search).paginate(:page => params[:page])
  end
  
  def list_debtor
    @search = PaymentReceived.search(params[:search])
    @payment_receiveds = PaymentReceived.db_active(@search).paginate(:page => params[:page])
  end
  
  def list_period
    @search = PaymentReceived.search(params[:search])
    @payment_receiveds = PaymentReceived.db_active(@search).paginate(:page => params[:page])
  end
  
  def show
    @payment_received = PaymentReceived.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @payment_received }  # use for ajax, 4/5/2013
    end
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
      @payment_received.payment_received_update_to_statement
      redirect_to @payment_received, notice: 'Payment Received was successfully created.'
    else
      flash[:alert] = @payment_received.errors.full_messages.join(", ")
      render action: "new"
    end
  end

  def update
    @payment_received = PaymentReceived.find(params[:id])
    if @payment_received.update_attributes(params[:payment_received])
      redirect_to @payment_received, notice: 'Payment Received was successfully updated.'
    else
      flash[:alert] = @payment_received.errors.full_messages.join(", ")
      render action: "edit"
    end
  end

  def destroy
    @payment_received = PaymentReceived.find(params[:id])
    @payment_received.update_attributes!(:status_id => DataStatus::KEEP_IN_VIEW)
    redirect_to payment_receiveds_url, :notice => "The Payment Received has dropped to KIV."
  end
  
  def recover
    @payment_received = PaymentReceived.find(params[:id])
    @payment_received.update_attributes!(:status_id => DataStatus::ACTIVE)
    redirect_to kiv_payment_receiveds_url, :notice => "The Payment Received has recovered from KIV."
  end
  
  def printable_debtor
    @search = PaymentReceived.search(params[:search])
    @payment_receiveds = PaymentReceived.db_active(@search).paginate(:page => params[:page])
    render :layout => false
  end
  
  def printable_period
    @search = PaymentReceived.search(params[:search])
    @payment_receiveds = PaymentReceived.db_active(@search).paginate(:page => params[:page])
    render :layout => false
  end
  
  def cheque_active
    @cheque = PaymentReceived.where("trade_company_id = ? and status_id = ?", params[:trade_company_id], DataStatus::ACTIVE)
    render :json => @cheque
  end
end
