class SalesOrdersController < ApplicationController
  before_filter :authenticate_user!
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  
  def index
    @search = SalesOrder.search(params[:search])
    @sales_orders = SalesOrder.db_active(@search)
    @sales_orders = @sales_orders.paginate(:page => params[:page])
  end
  
  def dummy_so
    @search = SalesOrder.search(params[:search])
    @sales_orders = SalesOrder.db_active(@search)
  end
  
  def kiv
    @search = SalesOrder.search(params[:search])
    @sales_orders = SalesOrder.db_kiv(@search)
    @sales_orders = @sales_orders.paginate(:page => params[:page])
  end

  def show
    @sales_order = SalesOrder.find(params[:id])
  end

  def new
    @sales_order = SalesOrder.new
  end

  def edit
    @sales_order = SalesOrder.find(params[:id])
  end

  def create
    @sales_order = SalesOrder.new(params[:sales_order])
    check_sales_order_items, msg = SaleOrderManagement.running_sales_order_items(params[:datarow], @sales_order)
    if check_sales_order_items.present? && @sales_order.save
      company.update_attributes(:sn_sales_order_no => @sales_order.sales_order_no)
      redirect_to @sales_order, notice: "Sales Order No # #{@sales_order.sales_order_no} was successfully created."
    else
      msg.present? ? msg : msg = []
      msg << @sales_order.errors.full_messages
      flash[:alert] = msg.join(', ')
      render action: "new"
    end
  end 

  def update
    @sales_order = SalesOrder.find(params[:id])
    check_sales_order_items, msg = SaleOrderManagement.running_sales_order_items(params[:datarow], @sales_order)
    if check_sales_order_items.present? and @sales_order.update_attributes(params[:sales_order])
      redirect_to @sales_order, notice: "Sales Order No # #{@sales_order.sales_order_no} was successfully updated."
    else
      msg.present? ? msg : msg = []
      msg << @sales_order.errors.full_messages
      flash[:alert] = msg.join(', ')
      render action: "edit"
    end
  end

  def destroy
    @sales_order = SalesOrder.find(params[:id])
    @sales_order.update_attributes(:status => SalesOrder::KEEP_IN_VIEW)
    redirect_to sales_orders_url, :notice => "S/O No # #{@sales_order.sales_order_no} has dropped to KIV."
  end
  
  def recover
    @sales_order = SalesOrder.find(params[:id])
    @sales_order.update_attributes(:status => SalesOrder::ACTIVE)
    redirect_to kiv_sales_orders_url, :notice => "S/O No # #{@sales_order.sales_order_no} has recovered."
  end
  
  def customer_registration
    @quotation_request_forms = QuotationRequestForm.customer_confirmed.select { |attr_b| attr_b['trade_company_id'].blank? }
  end
end
