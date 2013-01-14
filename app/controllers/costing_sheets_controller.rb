class CostingSheetsController < ApplicationController
  before_filter :authenticate_user!
  layout "sheetbox"

  def index
    @quotation_requisition = QuotationRequestForm.find(params[:id])
    @costing_sheets = @quotation_requisition.costing_sheets.reject {|s| s.status == CostingSheet::KEEP_IN_VIEW } if @quotation_requisition.costing_sheets.present?

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @costing_sheets }
    end
  end

  def show
    @costing_sheet = CostingSheet.find(params[:id])
#    @formulation = CostingSheetFormulation.db_active

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @costing_sheet }
    end
  end
  
  def printable
    @costing_sheet = CostingSheet.find(params[:id])
  end

  def new
    @formulations = CostingSheetFormulation.db_active
    
    @qr_id = params[:id]
    
    @quotation_requisition = QuotationRequestForm.find(@qr_id)
    @costing_active = @quotation_requisition.costing_sheets.reject {|s| s.status == CostingSheet::KEEP_IN_VIEW }
    if @costing_active.present?
      @costing = @costing_active.last
      @costing_sheet = @costing.dup
    else
      @costing_sheet = CostingSheet.new
    end
    

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @costing_sheet }
    end
  end

  # GET /costing_sheets/1/edit
  def edit
    @formulations = CostingSheetFormulation.db_active
    @costing_sheet = CostingSheet.find(params[:id])
  end

  # POST /costing_sheets
  # POST /costing_sheets.json
  def create
    @costing_sheet = CostingSheet.new(params[:costing_sheet])

    respond_to do |format|
      if @costing_sheet.save
        CostingSheet.comparator_cs(@costing_sheet)
        format.html { redirect_to @costing_sheet, notice: 'Costing sheet was successfully created.' }
        format.json { render json: @costing_sheet, status: :created, location: @costing_sheet }
      else
        format.html { render action: "new" }
        format.json { render json: @costing_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /costing_sheets/1
  # PUT /costing_sheets/1.json
  def update
    @costing_sheet = CostingSheet.find(params[:id])

    respond_to do |format|
      if @costing_sheet.update_attributes(params[:costing_sheet])
        format.html { redirect_to @costing_sheet, notice: 'Costing sheet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @costing_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /costing_sheets/1
  # DELETE /costing_sheets/1.json
  def destroy
    @costing_sheet = CostingSheet.find(params[:id])
    @costing_sheet.update_attributes!(:status => CostingSheet::KEEP_IN_VIEW)

    respond_to do |format|
      format.html { redirect_to costing_sheets_url, :notice => "This costing sheet has moved to KIV successfully." }
      format.json { head :no_content }
    end
  end
  
  def kiv
    @costing_sheets = CostingSheet.get_kiv
  end
  
  def recover
    @costing_sheet = CostingSheet.find(params[:id])
    @costing_sheet.update_attributes!(:status => CostingSheet::ACTIVE)
    redirect_to kiv_costing_sheets_path, :notice => "This costing sheet has recovered from KIV."
  end
end
