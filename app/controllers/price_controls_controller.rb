class PriceControlsController < ApplicationController
layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  def index
    @search         = PriceControl.search(params[:search])
    @price_controls = PriceControl.search_price_control(@search).paginate(:page => params[:page])
  end
  
  def kiv
    @search         = PriceControl.search(params[:search])
    @price_controls = PriceControl.search_price_control_kiv(@search).paginate(:page => params[:page])
  end

  def show
    @price_control = PriceControl.find(params[:id])
  end

  def new
    @price_control = PriceControl.new
    @product = Product.find(params[:product_id]) if params[:product_id].present?
  end

  def create
    company_pp_no = company.sn_product_price_no + 1
    @price_control = PriceControl.new(params[:price_control])
    check_price_control, msg = PriceControl.running_price_control_items(params[:datarow], @price_control)
    
    if @price_control.save && check_price_control.present?
      company.update_attributes(:sn_product_price_no => company_pp_no)
      PriceControl.generating_product_customer(@price_control)
      redirect_to @price_control, notice: "PP No # #{@price_control.pp_no} was successfully created."
    else
      msg.present? ? msg : msg = []
      msg << @price_control.errors.full_messages
      flash[:alert] = msg.join(', ')
      render action: "new"
    end
  end

  def destroy
    @price_control = PriceControl.find(params[:id])
    @price_control.update_attributes!(:status => PriceControl::KEEP_IN_VIEW)
    redirect_to price_controls_path, :notice => "PP No # #{@price_control.pp_no} has moved to KIV."
  end
    
  def recover
    @price_control = PriceControl.find(params[:id])
    @price_control.update_attributes(:status => PriceControl::ACTIVE)
    redirect_to kiv_price_controls_path, :notice => "PP No # #{@price_control.pp_no} has recovered from KIV."
  end
  
  def take_old_unit_price_and_eff_date
    @pci = PriceControl.take_old_up_n_eff_date(params[:company_id], params[:product_id])
    if @pci.present?
      render json: @pci.attributes.merge({ "jstatus" => true }) 
    else
      render json: { :jstatus => false }
    end
  end
end
