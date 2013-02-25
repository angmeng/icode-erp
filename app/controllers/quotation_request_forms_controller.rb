class QuotationRequestFormsController < ApplicationController
  before_filter :authenticate_user!
  layout "sheetbox", :only => [:show, :new, :edit, :printable, :mailing]
  
  def index
    @search = QuotationRequestForm.search(params[:search])
    @quotation_request_forms = QuotationRequestForm.ordered_search_qrno(@search)
    @quotation_request_forms = @quotation_request_forms.where(:user_id => current_user.id) unless user_is_admin?
  end
  
  def pending_quotation
    if user_is_admin?
      @quotation_request_forms = QuotationRequestForm.where("status = ?", QuotationRequestForm::PENDING)
    else
      @quotation_request_forms = current_user.quotation_request_forms.where("status = ?", QuotationRequestForm::PENDING) if current_user.quotation_request_forms.present?
    end
  end
  
  def signature_quotation
    @quotation_request_forms = current_user.qrs.order("quotation_request_no DESC")
  end

  def show
    @quotation_request_form = QuotationRequestForm.find(params[:id])
    collect_all_process_types(@quotation_request_form)
    @cs = @quotation_request_form.costing_sheets.where(:status => CostingSheet::ACTIVE) if @quotation_request_form.costing_sheets.present?
    
    respond_to do |format|
      format.html
      format.json { render json: @quotation_request_form }
    end
  end

  def new
    @quotation_request_form = QuotationRequestForm.new

    respond_to do |format|
      format.html
      format.json { render json: @quotation_request_form }
    end
  end

  def edit
    @quotation_request_form = QuotationRequestForm.find(params[:id])
    @customer = trade_company_customer
    collect_all_process_types(@quotation_request_form)
  end

  def create
    @quotation_request_form = QuotationRequestForm.new(params[:quotation_request_form])
    migrater
    
    if @quotation_request_form.save
      company.update_attributes(:sn_quotation_request_no => @quotation_request_form.quotation_request_no)
      QuotationRequestForm.process_material(@quotation_request_form, params[:option_size], params[:printing_length_a], params[:printing_length_b], params[:printing_width_a], params[:printing_width_b], params[:printing_no_of_ups_a], params[:printing_no_of_ups_b])
      QuotationRequestForm.process_glueing(@quotation_request_form, params[:field_set], params[:varnish_type], params[:glueing], params[:die_cut], params[:sequent], params[:color_name], params[:color_code], params[:quantity], params[:pricing], params[:pre_print_type], params[:pre_print_type_other], params[:glueing_text], params[:stamping], params[:stamping_other], params[:lot_size], params[:part_no], params[:category_no], params[:stock_ref], params[:generate_flute_width], params[:generate_flute_length], params[:stamping_width], params[:stamping_length], params[:mould_no], params[:window_no])
      redirect_to @quotation_request_form, notice: 'Quotation request form was successfully created.' 
    else
      flash[:alert] = @quotation_request_form.errors.full_messages.join(", ")
      render action: "new" 
    end
  end
  
  def update_checkboxes
    if params[:checkbox_quotation].present?
      QuotationRequestForm.updating_pending_to_ip(params[:checkbox_quotation])
      redirect_to pending_quotation_quotation_request_forms_path, :notice => "Submitting to Director Successfully."
    else
      flash[:alert] = "Please check boxes from your quotation request."
      redirect_to pending_quotation_quotation_request_forms_path
    end
  end

  def update
    @quotation_request_form = QuotationRequestForm.find(params[:id])
    migrater
    
    if @quotation_request_form.update_attributes(params[:quotation_request_form])
      mat, msg = QuotationRequestForm.process_material(@quotation_request_form, params[:option_size], params[:printing_length_a], params[:printing_length_b], params[:printing_width_a], params[:printing_width_b], params[:printing_no_of_ups_a], params[:printing_no_of_ups_b])
      if mat.present?
        QuotationRequestForm.process_glueing(@quotation_request_form, params[:field_set], params[:varnish_type], params[:glueing], params[:die_cut], params[:sequent], params[:color_name], params[:color_code], params[:quantity], params[:pricing], params[:pre_print_type], params[:pre_print_type_other], params[:glueing_text], params[:stamping], params[:stamping_other], params[:lot_size], params[:part_no], params[:category_no], params[:stock_ref], params[:generate_flute_width], params[:generate_flute_length], params[:stamping_width], params[:stamping_length], params[:mould_no], params[:window_no])
        redirect_to @quotation_request_form, notice: 'Quotation request form was successfully updated.'
      else
        collect_all_process_types(@quotation_request_form)
        flash[:alert] = msg
        render "edit"
      end
    else
      collect_all_process_types(@quotation_request_form)
      flash[:alert] = @quotation_request_form.errors.full_messages.join(", ")
      render action: "edit"
    end
  end

  def destroy
    @quotation_request_form = QuotationRequestForm.find(params[:id])
    @quotation_request_form.update_attributes(:status => QuotationRequestForm::KEEP_IN_VIEW)
    if action_name == "pending_quotation"
      redirect_to pending_quotation_quotation_request_forms_url, :notice => "QR No ##{@quotation_request_form.quotation_request_no} has dropped to KIV successfully."
    else
      redirect_to quotation_request_forms_url, :notice => "QR No ##{@quotation_request_form.quotation_request_no} has dropped to KIV successfully."
    end
  end
  
  def no_button
    @quotation_request_form = QuotationRequestForm.find(params[:id])
    @quotation_request_form.status_remark = params[:status_remark]
    @quotation_request_form.qr_status = QuotationRequestForm::REJECTED
    @quotation_request_form.qr_task = @quotation_request_form.user_id
    @quotation_request_form.save!
    redirect_to edit_quotation_request_form_path(@quotation_request_form), :notice => "QR no.#{@quotation_request_form.quotation_request_no} was sent back to Quoter."
  end
  
  def yes_button
    user = User.find_by_level(User::LEVEL_FIVE)
    @quotation_request_form = QuotationRequestForm.find(params[:id])
    @quotation_request_form.update_attributes(:status => QuotationRequestForm::APPROVED, :status_remark => nil, :qr_task => nil, :qr_status => nil, :director_approved => TRUE)
    redirect_to edit_quotation_request_form_path(@quotation_request_form), :notice => "QR no.#{@quotation_request_form.quotation_request_no} was approved successfully."
  end
  
  def quoter_press_yes
    boss = User.find_by_level(User::LEVEL_FIVE)
    @quotation_request_form = QuotationRequestForm.find(params[:id])
    @quotation_request_form.update_attributes(:qr_status => QuotationRequestForm::APPROVING, :qr_task => boss.id, :status_remark => nil)
    redirect_to edit_quotation_request_form_path(@quotation_request_form), :notice => "QR no.#{@quotation_request_form.quotation_request_no} submitting to Director."
  end
  
  def kiv
    @quotation_request_forms = QuotationRequestForm.ordered_qr_no_kiv
  end
  
  def recover
    @quotation_request_forms = QuotationRequestForm.find(params[:id])
    @quotation_request_forms.update_attributes(:status => QuotationRequestForm::PENDING, :status_remark => nil, :qr_task => nil, :qr_status => nil, :director_approved => false)
    redirect_to kiv_quotation_request_forms_path, :notice => "QR No #{@quotation_request_forms.quotation_request_no} has recovered from KIV." 
  end
  
  def printable
    @quotation_request_form = QuotationRequestForm.find(params[:id])
    collect_all_process_types(@quotation_request_form)
  end
  
  def mailing
    @quotation_request_form = QuotationRequestForm.find(params[:id])
  end
  
  def sending_mail
    @quotation_request_form = QuotationRequestForm.find(params[:id])
    collect_all_process_types(@quotation_request_form)
    if params[:user_from].present? and params[:user_to].present? and params[:user_subject].present? and params[:user_message].present? and params[:user_pdf_link].present?
      email = render_to_string(:action => 'printable', :layout => false)  
      email = PDFKit.new(email)  
      email = email.to_pdf 
      UserMailer.welcome_email(@quotation_request_form, params[:user_from], params[:user_to], params[:user_subject], params[:user_message], email).deliver
      @quotation_request_form.update_attributes(:send_count => @quotation_request_form.send_count.to_i + 1)
      render :text => "Email has been Sent successfully."
    else
      flash[:alert] = "All block and attachment file can't blank."
      render "mailing"
    end
  end
  
  def feedback
    if user_is_admin?
      @quotation_request_forms = QuotationRequestForm.quotation_approved
    else
      @quotation_request_forms = current_user.quotation_request_forms.quotation_approved
    end
  end
  
  def customer_confirm
    if params[:checkbox_quotation].present?
      if params[:confirmed_by].present? and params[:po_no].present?
        @confirm, msg = QuotationRequestForm.updating_approved_to_confirmed(params[:checkbox_quotation], params[:confirmed_by], params[:po_no])
        if @confirm.present?
          redirect_to feedback_quotation_request_forms_path, :notice => "Submitting to SALES ORDER status Successfully."
        else
          flash[:alert] = msg
          redirect_to feedback_quotation_request_forms_path
        end
      else
        flash[:alert] = "Confirmed by and Customer PO No# are missing."
        redirect_to feedback_quotation_request_forms_path
      end
    else
      flash[:alert] = "Please check boxes from your quotation request."
      redirect_to feedback_quotation_request_forms_path
    end
  end
  
  private
  
  def collect_all_process_types(quotation_request_form)
    @field_sets = quotation_request_form.selection_fieldsets.map(&:select_no)           if quotation_request_form.selection_fieldsets.present?
    @pre_print_types = quotation_request_form.pre_print_types.map(&:pre_print)          if quotation_request_form.pre_print_types.present?
    @pre_print_types_join = quotation_request_form.pre_print_types                      if quotation_request_form.pre_print_types.present?
    @varnish_types = quotation_request_form.selection_varnish_types.map(&:varnish_type) if quotation_request_form.selection_varnish_types.present?
    @stampings = quotation_request_form.selection_stampings.map(&:stamping_type)        if quotation_request_form.selection_stampings.present?
    @stampings_join = quotation_request_form.selection_stampings                        if quotation_request_form.selection_stampings.present?
    @die_cut = quotation_request_form.selection_die_cuts.map(&:content)                 if quotation_request_form.selection_die_cuts.present?
    @glueing_types = quotation_request_form.selection_glueings.map(&:glueing)           if quotation_request_form.selection_glueings.present?
    @glueing_types_join = quotation_request_form.selection_glueings                     if quotation_request_form.selection_glueings.present?
    @sequents = quotation_request_form.sequents.map(&:sequent_color)                    if quotation_request_form.sequents.present?
  end
  
  def migrater
    @quotation_request_form.quotation_request_no = company.sn_quotation_request_no.to_i + 1
    @quotation_request_form.collating_no = params[:collating_no]
    @quotation_request_form.color_no = params[:color_no]
  end
end
