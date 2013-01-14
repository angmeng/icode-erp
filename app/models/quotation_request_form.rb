class QuotationRequestForm < ActiveRecord::Base
  before_save   :uppercase_text
  before_update :uppercase_text
  
  attr_accessible :customer_code, :customer_name, :qrf_date, :description, :internal_dimensen_length, :internal_dimensen_width, :internal_dimensen_height, :internal_dimensen_tolerance, :external_dimensen_length, :external_dimensen_width, :external_dimensen_height, :external_dimensen_tolerance, :open_size_length, :open_size_width, 
                  :material_gramme, :unit_measurement_id, :material_type, :material_remark, :paper_width, :paper_length, :ratio, :option_size,
                  :color_no, :color_type, :barcode, :barcode_other, :shortage, :varnish, :surface_remark,
                  :lamination, :lamination_type, :lamination_remark, :lamination_type_joints, :flute_type, :flute_type_other, :flute_material, :flute_material_other, #:flute_width, :flute_length,
                  :stamping_per_box,
                  :die_cut_type, :die_cut_type_other, :window_shape, :window_shape_other, :mould_type, :mould_no,
                  :window_patching, :window_patching_type, :pre_print_textbox, :window_patching_type_other, :window_width, :window_length, :window_usage,
                  :glueing_material,
                  :packing_type, :packing_type_other, :packed_quantity,
                  :wax, :folding, :collating_no, :collect_sequence,
                  :no_of_moq, :remarks,
                  :updated_by, :authorized_by, :status, :status_remark, :quotation_request_no, :user_id,
                  :custom_stock_code, :box_part_no, :lot_size_no, :qr_task, :qr_status, :send_count, :director_approved,
                
                  :color, :material, :finishing, :triming,
                  :varnish_type, :quantity, :trade_company_id,  
                  :material_of_quantity, :unit_price,  
                  :paper_no_of_ups, :printing_width, :printing_length, :printing_no_of_ups,  :no_of_ups, :confirmed_by, :customer_po_no
                
    
  validates :customer_name, :qrf_date, :description, :open_size_length, :open_size_width, 
            :material_gramme, :unit_measurement_id, :paper_width, :paper_length, :ratio,
            :presence => true
  validates :quotation_request_no, :description, :uniqueness => true
  validates :color_no, :numericality => { :less_than_or_equal_to => 10 }, :allow_nil => true
  validates :lamination_type_joints, :numericality => { :less_than_or_equal_to => 3 }, :allow_nil => true
  validates :collating_no, :numericality => { :less_than_or_equal_to => 6 }, :allow_nil => true
   
  PENDING       = "P"
  IN_PROCESS    = "IP"
  APPROVED      = "A"
  CONFIRMED     = "CONFIRMED"
  KEEP_IN_VIEW  = "KIV"
#  
  # approving or rejecting
  APPROVING = "Approving"
  REJECTED = "Rejecting"
  
  SPOT = "SPOT"
  FULL = "FULL"
  NO = "NO"
  
  #Printing Process
  PROCESS = "PROCESS COLOR"
  PANTONE = "PANTONE"
  LOT = "LOT"
  MFG = "MGF DATE"
  BARCODE = "BARCODE"
  EAN13 = "EAN13"
  UPCA = "UPCA"
  CODE128 = "CODE128"
  CODE39 = "CODE39"
  STAMPING = "STAMPING"
  INJETPRINT = "INJETPRINT"
  WATERBASED = "WATERBASED"
  SOLVENT = "SOLVENT BASED"
  CALENDARING_COAT = "CALENDARING COAT"
  UV_COAT = "UV COAT"
  MATT_COAT = "MATT COAT"
  
  #Lamintation
  GLOSS = "OPP GLOSS"
  MATT = "OPP MATT"
  FLUTE = "FLUTE"
  B_FLUTE = "B-FLUTE"
  E_FLUTE = "E-FLUTE"
  
  #Stamping
  GOLD = "GOLD"
  SILVER = "SILVER"
  
  #Die Cut
  BOX_OUTLINE = "BOX OUTLINE"
  TRIMING = "TRIMING"
  WINDOW = "WINDOW"
  INTERLOCK = "INTERLOCK"
  FLAT = "FLAT"
  BUTTERFLY = "BUTTERFLY"
  RECTANGLE = "RECTANGLE"
  KIDNEY = "KIDNEY"
  OVAL = "OVAL"
  TRIANGLE = "TRIANGLE"
  
  #Window Patching
  OPP_FILM = "OPP FILM"
  PLAIN_FILM = "PLAIN FILM"
  PRE_PRINT = "PRE PRINT"
  PLASTIC_SHEET = "PLASTIC SHEET"
  
  #Glueing
  PRE_FOLD = "PRE-FOLD"
  
  #Packing
  BULK = "BULK"
  PACKET = "PACKET"
  CARTON = "CARTON"
  BIN = "BIN"
  
  OTHERS = "OTHERS"
  
  #Field Set
  COLOR_FIELDSET      = 1
  SURFACE_FIELDSET    = 2
  LAMINATION_FIELDSET = 3
  STAMPING_FIELDSET   = 4
  DIE_CUT_FIELDSET    = 5
  WINDOW_FIELDSET     = 6
  GLUEING_FIELDSET    = 7
  PACKING_FIELDSET    = 8
#  WAX_FIELDSET        = 9
#  FOLDING_FIELDSET    = 10
  COLLATING_FIELDSET  = 11
  MOQ_FIELDSET        = 12
  CUSTOM_FIELDSET        = 13
  
   
  NO_OF_DESIGN = [1,2,3,4,5,6,7,8,9,10]
  NO_OF_MOQ    = [1,2,3,4,5,6,7,8,9,10]
  
  has_one :product
  has_one :quotation_attachment_po
  
  has_many :colors, :dependent => :destroy
  has_many :pre_print_types, :dependent => :destroy
  
  has_many :selection_varnish_types, :dependent => :destroy
  has_many :selection_stampings, :dependent => :destroy
  has_many :selection_stamping_sizes, :dependent => :destroy
  has_many :selection_flute_sizes, :dependent => :destroy
  has_many :selection_glueings, :dependent => :destroy
  has_many :selection_die_cuts, :dependent => :destroy
  has_many :selection_die_cut_moulds, :dependent => :destroy
  has_many :sequents, :dependent => :destroy
  has_many :material_of_quantities, :dependent => :destroy
  has_many :selection_printing_sizes, :dependent => :destroy
  has_many :selection_fieldsets, :dependent => :destroy
  has_many :custom_productions, :dependent => :destroy
  has_many :costing_sheets, :dependent => :destroy
  
  belongs_to :trade_company
  belongs_to :unit_measurement
  belongs_to :user
  belongs_to :b_task, :class_name => "QuotationRequestForm", :foreign_key => "qr_task"  
  
  default_scope :order => "quotation_request_no DESC"
  
  def self.ordered_search_qrno(search)
#    search.order("quotation_request_no DESC").where("status != ?", QuotationRequestForm::KEEP_IN_VIEW)
    search.where("status != ?", QuotationRequestForm::KEEP_IN_VIEW)
  end
  
#  scope :ordered_qr_no, order("quotation_request_no DESC").where("status != ?", QuotationRequestForm::KEEP_IN_VIEW)
#  scope :ordered_qr_no_kiv, order("quotation_request_no DESC").where("status = ?", QuotationRequestForm::KEEP_IN_VIEW)
#  scope :customer_confirmed, where("status = ?", QuotationRequestForm::CONFIRMED)
#  scope :customer_confirmed_product_id, order("quotation_request_no DESC").where("status = ?", QuotationRequestForm::CONFIRMED)
#  scope :quotation_approved, order("quotation_request_no DESC").where("status = ?", QuotationRequestForm::APPROVED)

  scope :ordered_qr_no,                 where("status != ?", QuotationRequestForm::KEEP_IN_VIEW)
  scope :ordered_qr_no_kiv,             where("status = ?", QuotationRequestForm::KEEP_IN_VIEW)
  scope :customer_confirmed,            where("status = ?", QuotationRequestForm::CONFIRMED)
  scope :quotation_approved,            where("status = ?", QuotationRequestForm::APPROVED)
  
  def self.edit_fieldset(qrf, field_set)
    if field_set.present?
      qrf.selection_fieldsets.delete_all if qrf.selection_fieldsets.present? 
      field_set.each do |fs|
        qrf.selection_fieldsets.create!(:select_no => fs)
      end
    else
      qrf.selection_fieldsets.delete_all if qrf.selection_fieldsets.present? 
    end
  end
  
  def self.edit_color_code(qrf, color_name, color_code)
    if color_name.present? and color_code.present?
      qrf.colors.delete_all if qrf.colors.present? 
      color_name.each do |col_one, col_name|
        color_code.each do |col_two, col_code|
          if col_one == col_two
            qrf.colors.create!(:color_code => col_code[:val], :color_name => col_name[:val]) if col_code[:val].present? and col_name[:val].present?
          end
        end
      end
      qrf.update_attributes(:color_no => qrf.colors.size) if qrf.colors.size != qrf.color_no
    end
  end
  
  def self.edit_pre_print_type(qrf, pre_print_type, pre_print_type_other)
    qrf.pre_print_types.delete_all if qrf.pre_print_types.present?
    pre_print_type.each do |ppt|
      if ppt == QuotationRequestForm::OTHERS
        qrf.pre_print_types.create!(:pre_print => ppt, :other => pre_print_type_other)
      else
        qrf.pre_print_types.create!(:pre_print => ppt)
      end
    end
  end
  
  def self.clearing_color(qrf)
    if qrf.present?
      qrf.colors.delete_all if qrf.colors.present?
      qrf.pre_print_types.delete_all if qrf.pre_print_types.present?
      qrf.update_attributes(:color_no => nil, :color_type => nil, :barcode => nil, :barcode_other => nil, :shortage => nil)
    end
  end

  def self.edit_varnish_type(qrf, varnish_type)
    if qrf.present?
      qrf.selection_varnish_types.delete_all if qrf.selection_varnish_types.present?
      varnish_type.each do |vart|
        qrf.selection_varnish_types.create!(:varnish_type => vart)
      end
      qrf.update_attributes(:surface_remark => nil) if qrf.varnish == QuotationRequestForm::FULL
    end
  end
  
  def self.clearing_surface(qrf)
    if qrf.present?
      qrf.update_attributes(:varnish => nil, :surface_remark => nil) if qrf.varnish.present?
      qrf.selection_varnish_types.delete_all if qrf.selection_varnish_types.present?
    end
  end

  def self.edit_lamination(qrf, generate_flute_width, generate_flute_length)
    if qrf.present?
      
      if generate_flute_width.present? and generate_flute_length.present?
        qrf.selection_flute_sizes.delete_all if qrf.selection_flute_sizes.present?
        
        generate_flute_width.each do |flute_one, val_one|
          generate_flute_length.each do |flute_two, val_two|
            if flute_one == flute_two
              qrf.selection_flute_sizes.create!(:flute_width => val_one[:val], :flute_length => val_two[:val])
            end
          end
        end
      end
      
      qrf.update_attributes(:lamination_remark => nil) if qrf.lamination == QuotationRequestForm::FULL
    end
  end
  
  def self.clearing_lamination(qrf)
    if qrf.present?
      qrf.update_attributes!(:lamination => nil, :lamination_remark => nil, :lamination_type => nil, :lamination_type_joints => nil, :flute_type => nil, :flute_type_other => nil, :flute_material => nil, :flute_material_other => nil)
    end
  end

  def self.edit_stamping(qrf, stamping, stamping_other, stamping_width, stamping_length)
    qrf.selection_stampings.delete_all if qrf.selection_stampings.present?
    stamping.each do |stamp|
      if stamp == QuotationRequestForm::OTHERS
        qrf.selection_stampings.create!(:stamping_type => stamp, :stamping_other => stamping_other)
      else
        qrf.selection_stampings.create!(:stamping_type => stamp)
      end
    end
    
    if stamping_width.present? and stamping_length.present?
      qrf.selection_stamping_sizes.delete_all if qrf.selection_stamping_sizes.present?
      stamping_width.each do |width_no, content_one|
        stamping_length.each do |length_no, content_two|
          if width_no == length_no
            qrf.selection_stamping_sizes.create!(:stamping_width => content_one[:val], :stamping_length => content_two[:val])
          end
        end
      end
      qrf.update_attributes!(:stamping_per_box => qrf.selection_stamping_sizes.size) if qrf.selection_stamping_sizes.size != qrf.stamping_per_box
    end
  end
  
  def self.clearing_stamping(qrf)
    qrf.selection_stampings.delete_all if qrf.selection_stampings.present?
    qrf.selection_stamping_sizes.delete_all if qrf.selection_stamping_sizes.present?
    qrf.update_attributes!(:stamping_per_box => nil)
  end

  def self.edit_die_cut(qrf, die_cut, m_no, w_no)
    qrf.selection_die_cuts.delete_all if qrf.selection_die_cuts.present?
    die_cut.each do |dcut|
      qrf.selection_die_cuts.create!(:content => dcut)
    end
    
    if m_no.present? and w_no.present?
        qrf.selection_die_cut_moulds.delete_all if qrf.selection_die_cut_moulds.present?
        
        m_no.each do |mould, val_one|
          w_no.each do |window, val_two|
            if mould == window
              qrf.selection_die_cut_moulds.create!(:mould_no => val_one[:val], :window_no => val_two[:val])
            end
          end
        end
    end
    
  end
  
  def self.clearing_die_cut(qrf)
    qrf.selection_die_cuts.delete_all if qrf.selection_die_cuts.present?
    qrf.selection_die_cut_moulds.delete_all if qrf.selection_die_cut_moulds.present?
    qrf.update_attributes(:die_cut_type => nil, :window_shape => nil, :die_cut_type_other => nil, :window_shape_other => nil)
  end
  
  def self.clearing_window(qrf)
    qrf.update_attributes(:window_patching => nil, :window_patching_type => nil, :window_patching_type_other => nil, :window_width => nil, :window_length => nil, :window_usage => nil, :pre_print_textbox => nil)
  end
  
  def self.edit_glueing(qrf, glueing, text)
    qrf.selection_glueings.delete_all if qrf.selection_glueings.present?
    glueing.each do |gl|
      if gl == QuotationRequestForm::OTHERS
        qrf.selection_glueings.create!(:glueing => gl, :glueing_other => text)
      else
        qrf.selection_glueings.create!(:glueing => gl)
      end
    end
  end
  
  def self.clearing_glueing(qrf)
    if qrf.present?
      qrf.selection_glueings.delete_all if qrf.selection_glueings.present?
      qrf.update_attributes(:glueing_material => nil)
    end
  end
  
  def self.clearing_packing(qrf)
    if qrf.present?
      qrf.update_attributes(:packing_type => nil, :packing_type_other => nil, :packed_quantity => nil)
    end
  end
  
  def self.edit_sequent(qrf, sequent)
    if sequent.present?
      qrf.sequents.delete_all if qrf.sequents.present?
      sequent.each do |seq|
        qrf.sequents.create!(:sequent_color => seq) if seq.present?
      end
      qrf.update_attributes(:collating_no => qrf.sequents.size) if qrf.sequents.size != qrf.collating_no
    end
  end
  
  def self.clearing_collating(qrf)
    if qrf.present?
      qrf.sequents.delete_all if qrf.sequents.present?
      qrf.update_attributes(:collating_no => nil, :collect_sequence => nil)
    end
  end
    
  def self.edit_qty_n_price(qrf, qty, price)
    qrf.material_of_quantities.delete_all if qrf.material_of_quantities.present?
    qty.each do |qty_no, content_one|
      price.each do |pc, content_two|
          if pc == qty_no
            if content_one[:qty].present? and content_two[:price].present?
              qrf.material_of_quantities.create!(:quantity => content_one[:qty], :unit_price => content_two[:price])
            end
          end
      end
    end
  end
  
  def self.clearing_moq(qrf)
    if qrf.present?
      qrf.material_of_quantities.delete_all if qrf.material_of_quantities.present?
      qrf.update_attributes!(:no_of_moq => nil, :remarks => nil)
    end
  end
  
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
  
  def self.updating_pending_to_ip(checkbox_quotation)
    user = User.find_by_level(User::LEVEL_FIVE)
    checkbox_quotation.each do |cq|
      quo = QuotationRequestForm.find_by_id(cq)
      if quo.present?
        quo.update_attributes(:status => QuotationRequestForm::IN_PROCESS, :qr_task => user.id, :qr_status => QuotationRequestForm::APPROVING)
      end
    end
  end
  
  def self.updating_approved_to_confirmed(checkbox_quotation, confirmed_by, po_no)
    checkbox_quotation.each do |cbox|
      po_no.each do |no, content|
        if cbox.to_i == no.to_i
          if content[:tfield].present?
            quo = QuotationRequestForm.find_by_id(cbox)
            if quo.present?
#              QuotationAttachmentPo.create!(:po_no => content[:tfield], :quotation_request_form_id => quo.id)
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
  
  def self.edit_custom(qrf, lot_size, part_no, category_no, stock_ref)
    
    qrf.custom_productions.delete_all if qrf.custom_productions.present?
    lot_size.each do |lot_one, val_one|
      part_no.each do |lot_two, val_two|
        if lot_one == lot_two
          category_no.each do |lot_three, val_three|
            if lot_one == lot_three
              stock_ref.each do |lot_four, val_four|
                if lot_one == lot_four
                  qrf.custom_productions.create!(:lot_size => val_one[:size], :part_no => val_two[:part], :category_no => val_three[:category], :stock_reference => val_four[:ref])
                end
              end
            end
          end
        end
      end
    end
    
  end
  
  def self.clearing_custom(qrf)
    if qrf.present?
      qrf.custom_productions.delete_all if qrf.custom_productions.present?
      qrf.update_attributes!(:custom_stock_code => nil, :box_part_no => nil, :lot_size_no => nil)
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
  
  def self.update_for_qr(customer_update_qr, trade_company)
    @quotation = QuotationRequestForm.find_all_by_customer_name(customer_update_qr)
    if @quotation.present?
      @quotation.each do |name|
        name.update_attributes!(:trade_company_id => trade_company.id, :customer_code => trade_company.code) if name.trade_company_id.blank? and name.customer_code.blank?
      end
    end
  end
  
  private 
  
  def uppercase_text
    self.customer_name.upcase! if self.customer_name.present?
    self.description.upcase!   if self.description.present?
    self.material_type.upcase! if self.material_type.present?
    self.pre_print_textbox.upcase! if self.pre_print_textbox.present?
    self.barcode_other.upcase! if self.barcode_other.present?
    self.window_shape_other.upcase! if self.window_shape_other.present?
    self.window_patching_type_other.upcase! if self.window_patching_type_other.present?
    self.die_cut_type_other.upcase! if self.die_cut_type_other.present?
    self.glueing_material.upcase! if self.glueing_material.present?
    self.flute_type_other.upcase! if self.flute_type_other.present?
    self.flute_material_other.upcase! if self.flute_material_other.present?
    self.custom_stock_code.upcase! if self.custom_stock_code.present?
    self.box_part_no.upcase! if self.box_part_no.present?
    self.surface_remark.upcase! if self.surface_remark.present?
#    self.material_remark.upcase! if self.material_remark.present?
    self.lamination_remark.upcase! if self.lamination_remark.present?
    self.customer_po_no.upcase! if self.customer_po_no.present?
    
    if self.window_patching == FALSE
      self.window_patching_type = ''
      self.window_patching_type_other = ''
      self.pre_print_textbox = ''
      self.window_width = ''
      self.window_length = ''
      self.window_usage = ''
    end
  end
end
