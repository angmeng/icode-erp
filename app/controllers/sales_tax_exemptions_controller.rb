class SalesTaxExemptionsController < ApplicationController
  before_filter :authenticate_user!
#  before_filter :inventory_management_system
  layout "sheetbox", :only => [:new, :new_customer, :create, :edit, :update, :show]
  
  def index                       # For Supplier with valid
    @search = SalesTaxExemption.search(params[:search])
    @sales_tax_exemptions = SalesTaxExemption.only_supplier(@search)
  end
  
  def customer                    # For Customer with valid
    @search = SalesTaxExemption.search(params[:search])
    @sales_tax_exemptions = SalesTaxExemption.only_customer(@search)
  end
  
#  def supplier_invalid            # For Supplier with invalid
#    @search = SalesTaxExemption.search(params[:search])
#    @sales_tax_exemptions = SalesTaxExemption.order_supplier_invalid(@search)
#  end
#  
#  def customer_invalid            # For Customer with invalid
#    @search = SalesTaxExemption.search(params[:search])
#    @sales_tax_exemptions = SalesTaxExemption.order_customer_invalid(@search)
#  end
  
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

  # GET /sales_tax_exemptions/1/edit
  def edit
    @sales_tax_exemption = SalesTaxExemption.find(params[:id])
    @perihal_barang = @sales_tax_exemption.company_type == SalesTaxExemption::CUSTOMER ? SalesTaxExemption.perihal_barang_customer : SalesTaxExemption.perihal_barang_supplier
  end

  def create
    @sales_tax_exemption = SalesTaxExemption.new(params[:sales_tax_exemption])
    SalesTaxExemptionManagement.running_items(params[:datarow], @sales_tax_exemption)
    
    respond_to do |format|
      if @sales_tax_exemption.save
        format.html { 
          SalesTaxExemptionManagement.connect_company(@sales_tax_exemption)
          company.update_attributes(:sn_sales_tax_exemption_no => @sales_tax_exemption.running_no)
          redirect_to @sales_tax_exemption, notice: 'Sales tax exemption was successfully created.' 
        }
        format.json { render json: @sales_tax_exemption, status: :created, location: @sales_tax_exemption }
      else
        @perihal_barang = @sales_tax_exemption.company_type == SalesTaxExemption::CUSTOMER ? SalesTaxExemption.perihal_barang_customer : SalesTaxExemption.perihal_barang_supplier
        flash[:alert] = @sales_tax_exemption.errors.full_messages.join(", ")
        format.html { render action: "new" }
        format.json { render json: @sales_tax_exemption.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @sales_tax_exemption = SalesTaxExemption.find(params[:id])
    SalesTaxExemption.running_items(params[:datarow], @sales_tax_exemption)

    respond_to do |format|
      if @sales_tax_exemption.update_attributes(params[:sales_tax_exemption])
        format.html { redirect_to @sales_tax_exemption, notice: 'Sales tax exemption was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @sales_tax_exemption.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @sales_tax_exemption = SalesTaxExemption.find(params[:id])
    @sales_tax_exemption.update_attributes(:status => SalesTaxExemption::KEEP_IN_VIEW)

    respond_to do |format|
      format.html { redirect_to sales_tax_exemptions_url, :notice => "This Sales Tax Exemption No. has dropped to KIV." }
      format.json { head :no_content }
    end
  end
  
  def recover
    @sales_tax_exemption = SalesTaxExemption.find(params[:id])
    @sales_tax_exemption.update_attributes(:status => SalesTaxExemption::ACTIVE)

    respond_to do |format|
      format.html { redirect_to kiv_sales_tax_exemptions_url, :notice => "This Sales Tax Exemption No. has moved out from KIV." }
      format.json { head :no_content }
    end
  end
  
  def display_items
    @ste = SalesTaxExemption.find(params[:id])
    render :layout => "sheetbox"
  end
  
  
  
  private
#  def inventory_management_system
#    role(SalesTaxExemption::ROLE)
#  end
end
