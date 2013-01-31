class PriceControlsController < ApplicationController
  before_filter :authenticate_user!
#  layout "sheetbox"
  
  # GET /price_controls
  # GET /price_controls.json
  def index
    @price_controls = PriceControl.db_active

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @price_controls }
    end
  end

  # GET /price_controls/1
  # GET /price_controls/1.json
  def show
    @price_control = PriceControl.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @price_control }
    end
  end

  # GET /price_controls/new
  # GET /price_controls/new.json
  def new
    @price_control = PriceControl.new
    render :layout => "sheetbox"
#    @pri = current_user.price_control_items.db_active if current_user.price_control_items.db_active.present?
  end

  # POST /price_controls
  # POST /price_controls.json
  def create
    @price_control = PriceControl.new(params[:price_control])
    num = company.sn_product_price_no.to_i + 1
    @price_control.pp_no = num
    check_price_control, msg = PriceControl.running_price_control_items(params[:datarow], @price_control)
    
    if @price_control.save and check_price_control.present?
      company.update_attributes(:sn_product_price_no => num)
      PriceControl.generating_product_customer(@price_control)
      redirect_to @price_control, notice: 'Product Price Control was successfully created.'
    else
      msg << @price_control.errors.full_messages
      flash[:alert] = msg.join(', ')
      render action: "new"
    end
  end
  
  def edit
    @price_control = PriceControl.find(params[:id])
    @pri = current_user.price_control_items.db_active if current_user.price_control_items.db_active.present?
  end

  # PUT /price_controls/1
  # PUT /price_controls/1.json
  def update
    @price_control = PriceControl.find(params[:id])

    respond_to do |format|
      if @price_control.update_attributes(params[:price_control])
        format.html { redirect_to @price_control, notice: 'Price control was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @price_control.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /price_controls/1
  # DELETE /price_controls/1.json
  def destroy
    @price_control = PriceControl.find(params[:id])
    @price_control.destroy

    respond_to do |format|
      format.html { redirect_to price_controls_url }
      format.json { head :no_content }
    end
  end
  
  def moving_kiv
    @price_control = PriceControl.find(params[:id])
    @price_control.update_attributes!(:status => PriceControl::KEEP_IN_VIEW)
    redirect_to price_controls_path, :notice => "PP No.#{@price_control.pp_no} has moved to KIV."
  end
  
  def kiv
    @price_controls = PriceControl.db_kiv
  end
  
  def recover
    @price_control = PriceControl.find(params[:id])
    @price_control.update_attributes(:status => PriceControl::ACTIVE)
    redirect_to kiv_price_controls_path, :notice => "PP No.#{@price_control.pp_no} has recovered from KIV."
  end
  
  def take_old_unit_price_and_eff_date
    @pci = PriceControl.take_old_up_n_eff_date(params[:company_id], params[:product_id])
    if @pci.present?
      render json: @pci
    end
  end
end
