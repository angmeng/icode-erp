class BomsController < ApplicationController
  layout "sheetbox", :only => [:show, :new, :create, :edit, :update, :active_so]

  def index
    @boms = Bom.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @boms }
    end
  end
  
  def active_so
    @sales_orders = SalesOrder.where(:status => SalesOrder::ACTIVE)
  end

  # GET /boms/1
  # GET /boms/1.json
  def show
    @bom = Bom.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bom }
    end
  end

  def new
    @bom = Bom.new
    @quotation = QuotationRequestForm.find params[:id] if params[:id].present?
    collect_all_process_types(@quotation) if @quotation

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bom }
    end
  end

  # GET /boms/1/edit
  def edit
    @bom = Bom.find(params[:id])
  end

  # POST /boms
  # POST /boms.json
  def create
    @bom = Bom.new(params[:bom])

    respond_to do |format|
      if @bom.save
        format.html { redirect_to @bom, notice: 'Bom was successfully created.' }
        format.json { render json: @bom, status: :created, location: @bom }
      else
        format.html { render action: "new" }
        format.json { render json: @bom.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /boms/1
  # PUT /boms/1.json
  def update
    @bom = Bom.find(params[:id])

    respond_to do |format|
      if @bom.update_attributes(params[:bom])
        format.html { redirect_to @bom, notice: 'Bom was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @bom.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /boms/1
  # DELETE /boms/1.json
  def destroy
    @bom = Bom.find(params[:id])
    @bom.destroy

    respond_to do |format|
      format.html { redirect_to boms_url }
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
#    @glueing_types_join = quotation_request_form.selection_glueings                     if quotation_request_form.selection_glueings.present?
#    @sequents = quotation_request_form.sequents.map(&:sequent_color)                    if quotation_request_form.sequents.present?
  end
end
