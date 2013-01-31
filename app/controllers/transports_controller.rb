class TransportsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :are_you_director?
  layout "sheetbox"
  
  # GET /transports
  # GET /transports.json
  def index
    @search = Transport.search(params[:search])
    @transports = Transport.ordered_name(@search)
  end
  
  def kiv
    @search = Transport.search(params[:search])
    @transports = Transport.ordered_name_kiv(@search)
  end

  # GET /transports/1
  # GET /transports/1.json
  def show
    @transport = Transport.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @transport }
    end
  end

  # GET /transports/new
  # GET /transports/new.json
  def new
    @transport = Transport.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @transport }
    end
  end

  # GET /transports/1/edit
  def edit
    @transport = Transport.find(params[:id])
  end

  # POST /transports
  # POST /transports.json
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

  # PUT /transports/1
  # PUT /transports/1.json
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

  # DELETE /transports/1
  # DELETE /transports/1.json
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
