class CustomsController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  # GET /customs
  # GET /customs.json
  def index
#    @customs = Custom.ordered
    @customs = Custom.all
    render :layout => "application"
  end

  # GET /customs/1
  # GET /customs/1.json
  def show
    @custom = Custom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @custom }
    end
  end

  # GET /customs/new
  # GET /customs/new.json
  def new
    @custom = Custom.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @custom }
    end
  end

  # GET /customs/1/edit
  def edit
    @custom = Custom.find(params[:id])
  end

  # POST /customs
  # POST /customs.json
  def create
    @custom = Custom.new(params[:custom])
    @check, msg = Custom.check_qty(@custom.apply_qty, @custom.complete_qty)

    if @check.present?
      if @custom.save
        a = company.sn_sales_tax_exemption_no.to_i
        company.update_attributes(:sn_sales_tax_exemption_no => a + 1)
        @custom.update_attributes(:sales_tax_exemption_no => a + 1)
        redirect_to @custom, notice: 'Custom was successfully created.'
      else
        flash[:alert] = @custom.errors.full_messages.join(",")
        render action: "new"
      end
    else
      flash[:alert] = msg
      render action: "new"
    end
  end

  # PUT /customs/1
  # PUT /customs/1.json
  def update
    @custom = Custom.find(params[:id])
    if @custom.update_attributes(params[:custom])
      redirect_to @custom, notice: 'Custom was successfully updated.'
    else
      flash[:alert] = @custom.errors.full_messages.join(",")
      render action: "edit" 
    end
  end

  # DELETE /customs/1
  # DELETE /customs/1.json
  def destroy
    @custom = Custom.find(params[:id])
    @custom.destroy

    respond_to do |format|
      format.html { redirect_to customs_url }
      format.json { head :no_content }
    end
  end
end
