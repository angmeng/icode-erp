class SalesTaxExemptionsController < ApplicationController
  before_filter :authenticate_user!
  layout "sheetbox", :only => [:new, :new_customer, :create, :edit, :update, :show, :display_items]
  
  def index                       # For Supplier with valid
    @search = SalesTaxExemption.search(params[:search])
    @sales_tax_exemptions = SalesTaxExemption.only_supplier(@search)
  end
  
  def customer                    # For Customer with valid
    @search = SalesTaxExemption.search(params[:search])
    @sales_tax_exemptions = SalesTaxExemption.only_customer(@search)
  end
  
  def kiv_supplier
    @search = SalesTaxExemption.search(params[:search])
    @sales_tax_exemptions = SalesTaxExemption.order_kiv_supplier(@search)
  end
  
  def kiv_customer
    @search = SalesTaxExemption.search(params[:search])
    @sales_tax_exemptions = SalesTaxExemption.order_kiv_customer(@search)
  end

  def show
    @sales_tax_exemption = SalesTaxExemption.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @sales_tax_exemption }
    end
  end

  def new
    @sales_tax_exemption = SalesTaxExemption.new
    @perihal_barang = SalesTaxExemption.perihal_barang_supplier
  end
  
  def new_customer
    @sales_tax_exemption = SalesTaxExemption.new
    @perihal_barang = SalesTaxExemption.perihal_barang_customer
  end

  def edit
    @sales_tax_exemption = SalesTaxExemption.find(params[:id])
    @perihal_barang = @sales_tax_exemption.company_type == SalesTaxExemption::CUSTOMER ? SalesTaxExemption.perihal_barang_customer : SalesTaxExemption.perihal_barang_supplier
  end

  def create
    @sales_tax_exemption = SalesTaxExemption.new(params[:sales_tax_exemption])
    ste, msg = SalesTaxExemptionManagement.running_items(params[:datarow], @sales_tax_exemption)
    if ste.present? && @sales_tax_exemption.save
      SalesTaxExemptionManagement.connect_company(@sales_tax_exemption)
      company.update_attributes(:sn_sales_tax_exemption_no => @sales_tax_exemption.running_no)
      redirect_to @sales_tax_exemption, notice: "Running No # #{@sales_tax_exemption.running_no} was successfully created."
    else      
      @perihal_barang = @sales_tax_exemption.company_type == SalesTaxExemption::CUSTOMER ? SalesTaxExemption.perihal_barang_customer : SalesTaxExemption.perihal_barang_supplier
      msg.present? ? msg : msg = []
      msg << @sales_tax_exemption.errors.full_messages
      flash[:alert] = msg.join(',')
      render action: "new"
    end
  end

  def update
    @sales_tax_exemption = SalesTaxExemption.find(params[:id])
    SalesTaxExemption.running_items(params[:datarow], @sales_tax_exemption)
    if @sales_tax_exemption.update_attributes(params[:sales_tax_exemption])
      flash[:alert] = @sales_tax_exemption.errors.full_messages
      redirect_to @sales_tax_exemption, notice: "Running No # #{@sales_tax_exemption.running_no} was successfully updated."
    else
      render action: "edit"
    end
  end

  def destroy
    @sales_tax_exemption = SalesTaxExemption.find(params[:id])
    @sales_tax_exemption.update_attributes(:status => SalesTaxExemption::KEEP_IN_VIEW)
    if @sales_tax_exemption.company_type == SalesTaxExemption::CUSTOMER
      redirect_to customer_sales_tax_exemptions_url, :notice => "Running No # #{@sales_tax_exemption.running_no} has dropped to KIV."
    elsif @sales_tax_exemption.company_type == SalesTaxExemption::SUPPLIER
      redirect_to sales_tax_exemptions_url, :notice => "Running No # #{@sales_tax_exemption.running_no} has dropped to KIV."
    end
  end
  
  def recover
    @sales_tax_exemption = SalesTaxExemption.find(params[:id])
    @sales_tax_exemption.update_attributes(:status => SalesTaxExemption::ACTIVE)
    if @sales_tax_exemption.company_type == SalesTaxExemption::CUSTOMER
      redirect_to kiv_customer_sales_tax_exemptions_url, :notice => "Running No # #{@sales_tax_exemption.running_no} has recovered." 
    elsif @sales_tax_exemption.company_type == SalesTaxExemption::SUPPLIER
      redirect_to kiv_supplier_sales_tax_exemptions_url, :notice => "Running No # #{@sales_tax_exemption.running_no} has recovered." 
    end
  end
  
  def display_items
    @ste = SalesTaxExemption.find(params[:id])
  end
  
  private
#  def inventory_management_system
#    role(SalesTaxExemption::ROLE)
#  end
end
