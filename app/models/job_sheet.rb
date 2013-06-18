class JobSheet < ActiveRecord::Base
  attr_accessible :customer_name, :qrf_date, 
#    :internal_dimensen_tolerance, :external_dimensen_length, :external_dimensen_width,
#    :external_dimensen_height, :external_dimensen_tolerance, :open_size_length, :open_size_width,
#    :window_patching, :window_patching_type, :window_patching_type_other, :window_shape, :window_shape_other,
    :die_cut_type, :die_cut_type_other, :folding, :collating_no, :color_no, :color_type,
    :quotation_request_no, :updated_by, :authorized_by, :status,
    :material_remark, :surface_remark, :lamination_remark,
    :paper_no_of_ups, :option_size, :window_width, :window_length, :window_usage,
    :no_of_moq, :barcode, :barcode_other, :shortage, :pre_print_textbox, :glueing_material, :stamping_per_box,
    :lamination_type, :lamination_type_joints, :flute_type, :flute_type_other, :flute_material,
    :flute_material_other, :packing_type, :packing_type_other, :packed_quantity, :collect_sequence,
    :custom_stock_code, :box_part_no, :lot_size_no, 
  
    :rev, :job_sheet_date, :job_no, :customer_po_no, :trade_company_id, :eta, :description, :issue_note, 
    :requested_by, :requested_qty, :internal_dimensen_length, :internal_dimensen_width, :internal_dimensen_height,
    :size_xs_qty, :size_s_qty, :size_m_qty, :size_l_qty, :size_xl_qty, :size_xxl_qty,
    :printing_xs_qty, :printing_s_qty, :printing_m_qty, :printing_l_qty, :printing_xl_qty, :printing_xxl_qty,
    :uv, :varnish, :lamination, :die_cut, :glueing, :window, :wax, :finishing_other, :matt_varnish, :ink,
    :material_gramme, :unit_measurement_id, :material_type, :paper_width, :paper_length, :trim_size, :ratio,
    :remarks, :ori_size_qty, :packing_qty, :mould_no, :prepared_by, :sales_order_id, :film_no,
    :stock_xs_qty, :stock_s_qty, :stock_m_qty, :stock_l_qty, :stock_xl_qty, :stock_xxl_qty,
    :customer_ref, :wef
     
  belongs_to :sales_order
  
  ACTIVE        = 1
  KEEP_IN_VIEW  = 2
end
