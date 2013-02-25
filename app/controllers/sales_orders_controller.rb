class SalesOrdersController < ApplicationController
  before_filter :authenticate_user!
  layout "sheetbox", :only => [:show, :new, :edit]
  
  def index
    @search = SalesOrder.search(params[:search])
    @sales_orders = @search
  end
  
  def production
    @sales_orders = SalesOrder.where(:status => SalesOrder::IN_PROGRESS)
  end

  def show
    @sales_order = SalesOrder.find(params[:id])
  end

  def new
    @sales_order = SalesOrder.new
    @so_items = current_user.sales_order_items.db_pending
    @temp_company = @so_items.first if @so_items.size > 0
  end

  def edit
    @sales_order = SalesOrder.find(params[:id])
  end

  def create
    @sales_order = SalesOrder.new(params[:sales_order])
    so_no = company.sn_sales_order_no.to_i + 1
    @sales_order.sales_order_no = so_no
    check_sales_order_items, msg = SalesOrder.running_sales_order_items(params[:datarow], @sales_order)
    
    if @sales_order.save and check_sales_order_items.present?
      company.update_attributes(:sn_sales_order_no => so_no)
      @sales_order.running_update
      redirect_to @sales_order, notice: "Sales Order No.#{@sales_order.sales_order_no} was successfully created."
    else
      msg << @sales_order.errors.full_messages
      flash[:alert] = msg.join(', ')
      render action: "new"
    end
  end 

  def update
    @sales_order = SalesOrder.find(params[:id])

    respond_to do |format|
      if @sales_order.update_attributes(params[:sales_order])
        format.html { redirect_to @sales_order, notice: 'Sales order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sales_order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sales_order = SalesOrder.find(params[:id])
    @sales_order.destroy

    respond_to do |format|
      format.html { redirect_to sales_orders_url }
      format.json { head :no_content }
    end
  end
  
  def customer_registration
    @quotation_request_forms = QuotationRequestForm.customer_confirmed.group_by(&:customer_name)
  end
  
  def product_registration
    @quotation_request_forms = QuotationRequestForm.customer_confirmed
  end
end
