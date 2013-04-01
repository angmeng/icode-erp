class SalesOrdersController < ApplicationController
  before_filter :authenticate_user!
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  
  def index
    @search = SalesOrder.search(params[:search])
    @sales_orders = SalesOrder.db_active(@search)
    @sales_orders = @sales_orders.paginate(:page => params[:page])
  end
  
  def production
    @sales_orders = SalesOrder.where(:status => SalesOrder::IN_PROGRESS)
  end

  def show
    @sales_order = SalesOrder.find(params[:id])
  end

  def new
    @sales_order = SalesOrder.new
  end
#    @so_items = current_user.sales_order_items.db_pending
#    @temp_company = @so_items.first if @so_items.size > 0

  def edit
    @sales_order = SalesOrder.find(params[:id])
  end

  def create
    @sales_order = SalesOrder.new(params[:sales_order])
#    @sales_order.status = SalesOrder::IN_PROGRESS
    check_sales_order_items, msg = SaleOrderManagement.running_sales_order_items(params[:datarow], @sales_order)
    if check_sales_order_items.present? and @sales_order.save
      company.update_attributes(:sn_sales_order_no => @sales_order.sales_order_no)  #so_no
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
    redirect_to sales_orders_url
  end
  
  def customer_registration
    @quotation_request_forms = QuotationRequestForm.customer_confirmed.select { |attr_b| attr_b['trade_company_id'].blank? }
  end
  
  def product_registration
    @quotation_request_forms = QuotationRequestForm.customer_confirmed
  end
end
