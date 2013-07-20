class TransportsController < ApplicationController
  before_filter :are_you_director?
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  def index
    @search = Transport.search(params[:search])
    @transports = Transport.ordered_name(@search)
  end
  
  def kiv
    @search = Transport.search(params[:search])
    @transports = Transport.ordered_name_kiv(@search)
  end

  def show
    @transport = Transport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transport }
    end
  end

  def new
    @transport = Transport.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transport }
    end
  end

  def edit
    @transport = Transport.find(params[:id])
  end

  def create
    @transport = Transport.new(params[:transport])

    respond_to do |format|
      if @transport.save
        format.html { redirect_to @transport, notice: 'Transport was successfully created.' }
        format.json { render json: @transport, status: :created, location: @transport }
      else
        format.html { render action: "new" }
        format.json { render json: @transport.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @transport = Transport.find(params[:id])

    respond_to do |format|
      if @transport.update_attributes(params[:transport])
        format.html { redirect_to @transport, notice: 'Transport was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @transport.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @transport = Transport.find(params[:id])
    @transport.update_attributes(:status => Transport::KEEP_IN_VIEW)

    respond_to do |format|
      format.html { redirect_to transports_url, :notice => "This transport has moved to KIV." }
      format.json { head :no_content }
    end
  end
  
  def recover
    @transport = Transport.find(params[:id])
    @transport.update_attributes(:status => Transport::ACTIVE)

    respond_to do |format|
      format.html { redirect_to kiv_transports_url, :notice => "This transport has moved out from KIV." }
      format.json { head :no_content }
    end
  end
end
