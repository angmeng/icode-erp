class ChangeCompanyCodesController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update]
  def index
    @search = ChangeCompanyCode.search(params[:search])
    @change_company_codes = @search.order("created_at DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @change_company_codes }
    end
  end

  # GET /change_company_codes/1
  # GET /change_company_codes/1.json
  def show
    @change_company_code = ChangeCompanyCode.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @change_company_code }
    end
  end

  # GET /change_company_codes/new
  # GET /change_company_codes/new.json
  def new
    @change_company_code = ChangeCompanyCode.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @change_company_code }
    end
  end
  
  def create
    @change_company_code = ChangeCompanyCode.new(params[:change_company_code])
    @valid_new_code, msg = TradeCompany.valid_code(@change_company_code)
    if @valid_new_code.present?
      
      if @change_company_code.save
        @tcompany = TradeCompany.find_by_code(@change_company_code.old_code)
        @tcompany.update_attributes(:code => @change_company_code.new_code)

        redirect_to @change_company_code, notice: 'Change Company Code was successfully changed.'
      else
        flash[:alert] = @change_company_code.errors.full_messages.join(", ")
        render action: "new"
      end
      
    else
      flash[:alert] = msg
      render action: "new"
    end
  end

  # GET /change_company_codes/1/edit
  def edit
    @change_company_code = ChangeCompanyCode.find(params[:id])
  end
  

  # PUT /change_company_codes/1
  # PUT /change_company_codes/1.json
  def update
    @change_company_code = ChangeCompanyCode.find(params[:id])

    respond_to do |format|
      if @change_company_code.update_attributes(params[:change_company_code])
        format.html { redirect_to @change_company_code, notice: 'Change company code was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @change_company_code.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /change_company_codes/1
  # DELETE /change_company_codes/1.json
  def destroy
    @change_company_code = ChangeCompanyCode.find(params[:id])
    @change_company_code.destroy

    respond_to do |format|
      format.html { redirect_to change_company_codes_url }
      format.json { head :no_content }
    end
  end
end
