class JobSheetsController < ApplicationController
  before_filter :authenticate_user!
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update, :confirmed_quotation]
  
  def index
    @job_sheets = JobSheet.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @job_sheets }
    end
  end
  
  def confirmed_quotation
    @quotations = QuotationRequestForm.customer_confirmed.order("qrf_date DESC")
  end

  # GET /job_sheets/1
  # GET /job_sheets/1.json
  def show
    @job_sheet = JobSheet.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @job_sheet }
    end
  end

  # GET /job_sheets/new
  # GET /job_sheets/new.json
  def new
    @job_sheet = JobSheet.new
    @quotation = QuotationRequestForm.find(params[:id]) if params[:id]
    collect_all_process_types(@quotation)

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @job_sheet }
    end
  end

  # GET /job_sheets/1/edit
  def edit
    @job_sheet = JobSheet.find(params[:id])
  end

  # POST /job_sheets
  # POST /job_sheets.json
  def create
    @job_sheet = JobSheet.new(params[:job_sheet])

    respond_to do |format|
      if @job_sheet.save
        format.html { redirect_to @job_sheet, notice: 'Job sheet was successfully created.' }
        format.json { render json: @job_sheet, status: :created, location: @job_sheet }
      else
        format.html { render action: "new" }
        format.json { render json: @job_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /job_sheets/1
  # PUT /job_sheets/1.json
  def update
    @job_sheet = JobSheet.find(params[:id])

    respond_to do |format|
      if @job_sheet.update_attributes(params[:job_sheet])
        format.html { redirect_to @job_sheet, notice: 'Job sheet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @job_sheet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /job_sheets/1
  # DELETE /job_sheets/1.json
  def destroy
    @job_sheet = JobSheet.find(params[:id])
    @job_sheet.destroy

    respond_to do |format|
      format.html { redirect_to job_sheets_url }
      format.json { head :no_content }
    end
  end
  
  private
  
  def collect_all_process_types(quotation_request_form)
    @field_sets = quotation_request_form.selection_fieldsets.map(&:select_no)           if quotation_request_form.selection_fieldsets.present?
#    @pre_print_types = quotation_request_form.pre_print_types.map(&:pre_print)          if quotation_request_form.pre_print_types.present?
#    @pre_print_types_join = quotation_request_form.pre_print_types                      if quotation_request_form.pre_print_types.present?
#    @varnish_types = quotation_request_form.selection_varnish_types.map(&:varnish_type) if quotation_request_form.selection_varnish_types.present?
#    @stampings = quotation_request_form.selection_stampings.map(&:stamping_type)        if quotation_request_form.selection_stampings.present?
#    @stampings_join = quotation_request_form.selection_stampings                        if quotation_request_form.selection_stampings.present?
#    @die_cut = quotation_request_form.selection_die_cuts.map(&:content)                 if quotation_request_form.selection_die_cuts.present?
#    @glueing_types = quotation_request_form.selection_glueings.map(&:glueing)           if quotation_request_form.selection_glueings.present?
    @glueing_types_join = quotation_request_form.selection_glueings                     if quotation_request_form.selection_glueings.present?
#    @sequents = quotation_request_form.sequents.map(&:sequent_color)                    if quotation_request_form.sequents.present?
  end
end
