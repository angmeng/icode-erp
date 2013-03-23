class QuotationRequisitionManagement
  
  def self.process_material(qrf, option, printing_length_a, printing_length_b, printing_width_a, printing_width_b, printing_no_of_ups_a, printing_no_of_ups_b)
      pp_width  = qrf.paper_width
      pp_length = qrf.paper_length
        
      if option == "option_a"

        qrf.selection_printing_sizes.delete_all if qrf.selection_printing_sizes.present?
        if printing_length_a.present? and printing_width_a.present? and printing_no_of_ups_a.present?
          printing_length_a.each do |ratio_one, length|
            printing_width_a.each do |ratio_two, width|
              if ratio_one == ratio_two
                printing_no_of_ups_a.each do |ratio_three, ups|
                  if ratio_one == ratio_three
                    if length.present? and width.present? and ups.present?
                      qrf.selection_printing_sizes.create(:length => length[:val].to_f, :width => width[:val].to_f, :ups => ups[:val].to_i)
                    end
                  end
                end
              end
            end
          end
        end

      elsif option == "option_b"
        
          qrf.selection_printing_sizes.delete_all if qrf.selection_printing_sizes.present?
          if printing_length_b.present? and printing_width_b.present? and printing_no_of_ups_b.present?
              printing_length_b.each do |ratio_one, length|
                printing_width_b.each do |ratio_two, width|
                  if ratio_one == ratio_two
                    printing_no_of_ups_b.each do |ratio_three, ups|
                      if ratio_one == ratio_three
                        if length.present? and width.present? and ups.present?
                          qrf.selection_printing_sizes.create!(:length => length[:val].to_f, :width => width[:val].to_f, :ups => ups[:val].to_i)
                        end
                      end
                    end
                  end
                end
              end
          end
          
      else
        return true
      end
  end
  
  def self.process_glueing(qrfc, field_set, varnish_type, glue, cut, seq, colorname, colorcode, qty, pricing, pre_print_type, pre_print_type_other, glueing_text, stamping, stamping_other, lot_size, part_no, category_no, stock_ref, generate_flute_width, generate_flute_length, stamping_width, stamping_length, mould_no, window_no)
      @edit_field_set      = QuotationRequestForm.edit_fieldset(qrfc, field_set)
      
      if qrfc.selection_fieldsets.find_by_select_no(QuotationRequestForm::COLOR_FIELDSET).present?
        @edit_color          = QuotationRequestForm.edit_color_code(qrfc, colorname, colorcode) if colorcode.present? and colorname.present?
        @edit_pre_print_type = QuotationRequestForm.edit_pre_print_type(qrfc, pre_print_type, pre_print_type_other) if pre_print_type.present?
      else
        QuotationRequestForm.clearing_color(qrfc)
      end
      
      if qrfc.selection_fieldsets.find_by_select_no(QuotationRequestForm::SURFACE_FIELDSET)
        @edit_varnishtype = QuotationRequestForm.edit_varnish_type(qrfc, varnish_type) if varnish_type.present?
      else
        QuotationRequestForm.clearing_surface(qrfc)
      end
      
      if qrfc.selection_fieldsets.find_by_select_no(QuotationRequestForm::LAMINATION_FIELDSET)
        @edit_lamination = QuotationRequestForm.edit_lamination(qrfc, generate_flute_width, generate_flute_length)
      else
        QuotationRequestForm.clearing_lamination(qrfc)
      end

      if qrfc.selection_fieldsets.find_by_select_no(QuotationRequestForm::STAMPING_FIELDSET)
        @edit_stamping    = QuotationRequestForm.edit_stamping(qrfc, stamping, stamping_other, stamping_width, stamping_length) if stamping.present?
      else
        QuotationRequestForm.clearing_stamping(qrfc)
      end
      
      if qrfc.selection_fieldsets.find_by_select_no(QuotationRequestForm::DIE_CUT_FIELDSET)
        @edit_die_cut     = QuotationRequestForm.edit_die_cut(qrfc, cut, mould_no, window_no) if cut.present?
      else
        QuotationRequestForm.clearing_die_cut(qrfc)
      end
      
      unless qrfc.selection_fieldsets.find_by_select_no(QuotationRequestForm::WINDOW_FIELDSET)
        QuotationRequestForm.clearing_window(qrfc)
      end
      
      if qrfc.selection_fieldsets.find_by_select_no(QuotationRequestForm::GLUEING_FIELDSET)
        @edit_glueing     = QuotationRequestForm.edit_glueing(qrfc, glue, glueing_text) if glue.present?
      else
        QuotationRequestForm.clearing_glueing(qrfc)
      end
      
      unless qrfc.selection_fieldsets.find_by_select_no(QuotationRequestForm::PACKING_FIELDSET)
        QuotationRequestForm.clearing_packing(qrfc)
      end
      
      if qrfc.selection_fieldsets.find_by_select_no(QuotationRequestForm::COLLATING_FIELDSET)
        @edit_sequent     = QuotationRequestForm.edit_sequent(qrfc, seq) if seq.present?
      else
        QuotationRequestForm.clearing_collating(qrfc)
      end
      
      if qrfc.selection_fieldsets.find_by_select_no(QuotationRequestForm::MOQ_FIELDSET)
        @edit_qty_n_price = QuotationRequestForm.edit_qty_n_price(qrfc, qty, pricing) if qty.present? and pricing.present?
      else
        QuotationRequestForm.clearing_moq(qrfc)
      end
      
      if qrfc.selection_fieldsets.find_by_select_no(QuotationRequestForm::CUSTOM_FIELDSET)
        @edit_custom = QuotationRequestForm.edit_custom(qrfc, lot_size, part_no, category_no, stock_ref) if lot_size.present? or part_no.present? or category_no.present? or stock_ref.present?
      else
        QuotationRequestForm.clearing_custom(qrfc)
      end
  end
  
  def self.updating_pending_to_ip(checkbox_quotation)
    user = User.find_by_admin(true)
    checkbox_quotation.each do |cq|
      quo = QuotationRequestForm.find_by_id(cq)
      quo.update_attributes(:status => QuotationRequestForm::IN_PROCESS, :qr_task => user.id, :qr_status => QuotationRequestForm::APPROVING) if quo.present?
    end
  end
  
  def self.updating_approved_to_confirmed(checkbox_quotation, confirmed_by, po_no)
    checkbox_quotation.each do |cbox|
      po_no.each do |no, content|
        if cbox.to_i == no.to_i
          if content[:tfield].present?
            quo = QuotationRequestForm.find_by_id(cbox)
            if quo.present?
              quo.update_attributes!(:status => QuotationRequestForm::CONFIRMED, :confirmed_by => confirmed_by, :customer_po_no => content[:tfield])
              return true
            else
              return false, "quotation_request_form_id #{cbox.to_i} is missing."
            end
          else
            return false, "Customer PO No# with checkbox should not blank text field."
          end
        end
      end
    end
  end
  
  def self.update_for_qr(customer_update_qr, trade_company) 
    @quotation = QuotationRequestForm.find_all_by_customer_name(customer_update_qr)
    if @quotation.present?
      @quotation.each do |name|
        name.update_attributes!(:trade_company_id => trade_company.id) if name.trade_company_id.blank?
      end
    end
  end
    
end