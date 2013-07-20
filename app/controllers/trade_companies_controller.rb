class TradeCompaniesController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  def index
    @search = TradeCompany.search(params[:search])
    @trade_companies = TradeCompany.search_ordered_with_vendor_name(@search)
  end
  
  def customer
    @search = TradeCompany.search(params[:search])
    @trade_companies = TradeCompany.search_ordered_with_customer_name(@search)
  end
  
  def kiv_vendors
    @search = TradeCompany.search(params[:search])
    @trade_companies = TradeCompany.search_ordered_with_kiv_vendors(@search)
  end
  
  def kiv_customers
    @search = TradeCompany.search(params[:search])
    @trade_companies = TradeCompany.search_ordered_with_kiv_cutomers(@search)
  end

  def show
    @trade_company = TradeCompany.find(params[:id])
    ste_name, msg = @trade_company.loading_ste
    
    respond_to do |format|
      format.html
      format.json { 
        if ste_name.present?
          if ste_name == "stop_ste"
            render json: @trade_company.attributes.merge({ "ste_name" => msg, "working" => "stopped" }) 
          else
            render json: @trade_company.attributes.merge({ "ste_name" => ste_name }) 
          end
        else
          render json: @trade_company          
        end
      }
    end
  end

  def new
    @trade_company = TradeCompany.new
    if params[:temp_source_id].present?
      @vendor = TemporarySource.find_by_id(params[:temp_source_id]).company_name  #Vendor
      session[:option] = TradeCompany::SUPPLIER
    end
    session[:option] = params[:option] if params[:option].present?
    if params[:option] == TradeCompany::CUSTOMER and params[:qr_id].present?
      session[:qr_id] = params[:qr_id]
      @customer_company = QuotationRequestForm.find_by_id(session[:qr_id]) 
    end
  end

  def create
    @trade_company = TradeCompany.new(params[:trade_company])
    @trade_company.adding_contact(params[:datarow])
    if @trade_company.save
      QuotationRequisitionManagement.update_for_qr(params[:customer_update_qr], @trade_company) if params[:customer_update_qr].present? #update if qr.trade_company_id is blank..
      session[:option] = nil
      if params[:save_and_new_customer]
        redirect_to new_trade_company_path(:option => TradeCompany::CUSTOMER), notice: "Company Code # #{@trade_company.code} was successfully created."
      elsif params[:save_and_new_supplier]
        redirect_to new_trade_company_path(:option => TradeCompany::SUPPLIER), notice: "Company Code # #{@trade_company.code} was successfully created."
      else
        redirect_to @trade_company, notice: 'Trade company was successfully created.'
      end
    else
      @customer_company = QuotationRequestForm.find_by_id(session[:qr_id]) if session[:qr_id].present?
      flash[:alert] = @trade_company.errors.full_messages.join(", ")
      render action: 'new'
    end
  end

  def edit
    @trade_company = TradeCompany.find(params[:id])
    session[:option] = @trade_company.user_type == TradeCompany::CUSTOMER ? TradeCompany::CUSTOMER : TradeCompany::SUPPLIER
  end
  
  def update
    @trade_company = TradeCompany.find(params[:id])
    @trade_company.adding_contact(params[:datarow])
    respond_to do |format|
      if @trade_company.update_attributes(params[:trade_company])
        session[:customer] = nil
        format.html { redirect_to @trade_company, notice: 'Trade company was successfully updated.' }
        format.js   { render :js => "window.location.pathname='#{trade_company_path(@trade_company)}'" } 
      else
        format.html { 
          flash[:alert] = @trade_company.errors.full_messages.join(", ")
          render action: "edit" }
        format.js   { render :js => "alert('#{@trade_company.errors.full_messages.join(", ")}');" }
      end
    end
  end

  def destroy
    @trade_company = TradeCompany.find(params[:id])
    @trade_company.update_attributes(:status => TradeCompany::KIV)
    if @trade_company.user_type == TradeCompany::CUSTOMER
      redirect_to customer_trade_companies_path, :notice => "This customer details has dropped to KIV."
    else
      redirect_to trade_companies_path, :notice => "This vendor details has dropped to KIV."
    end
  end
  
  def recover
    @trade_company = TradeCompany.find(params[:id])
    @trade_company.update_attributes(:status => TradeCompany::ACTIVE)
    if @trade_company.user_type == TradeCompany::CUSTOMER
      redirect_to kiv_customers_trade_companies_path, :notice => "This customer details has moved out form KIV."
    else
      redirect_to kiv_vendors_trade_companies_path, :notice => "This vendor details has moved out from KIV."
    end
  end
  
  def auto_complete
    @trade_companies = TradeCompany.all
    @all_tradecompanies = []
    @trade_companies.each do |tc|
          @all_tradecompanies << "#{tc.code}" + " " + "#{tc.name}"  
    end
    render :text => @all_tradecompanies.to_json
  end
  
  def all_trade_companies #use vendor companies to autocomplete
#    @trade_company = TradeCompany.order("name").all
    array = TradeCompany.get_all_companies(trade_company_vendor)

    respond_to do |format|
      format.html
      format.json { render json: array }
    end
  end
  
  def all_suppliers #use vendor companies to autocomplete
    suppliers = TradeCompany.get_all_companies(trade_company_vendor)

    respond_to do |format|
      format.html
      format.json { render json: suppliers }
    end
  end
  
  def all_customers #use customer companies to autocomplete
    customers = TradeCompany.get_all_companies(trade_company_customer)

    respond_to do |format|
      format.html
      format.json { render json: customers }
    end
  end
  
#  def active_customer
#    @customer = trade_company_customer
#    respond_to do |format|
#      format.html # index.html.erb
#      format.json { render json: @customer }
#    end
#  end
  
  def customer_name_n_place_customer_id
    tc = TradeCompany.find_by_name(params[:customer_name])
    
    respond_to do |format|
      format.html
      format.json { render json: tc }
    end
  end
  
  private
#  def inventory_management_system
#    role(TradeCompany::ROLE)
#  end
end
