class CreateJobSheets < ActiveRecord::Migration
  def change
    create_table :job_sheets do |t|
      
      t.string :customer_name
      t.date :qrf_date
      
#      t.float :external_dimensen_length, :precision => 10, :scale => 2, :default => 0
#      t.float :external_dimensen_width, :precision => 10, :scale => 2, :default => 0
#      t.float :external_dimensen_height, :precision => 10, :scale => 2, :default => 0
#      t.float :external_dimensen_tolerance, :precision => 10, :scale => 2, :default => 0
      
      t.float :open_size_length, :precision => 10, :scale => 2, :default => 0
      t.float :open_size_width, :precision => 10, :scale => 2, :default => 0
      
#      t.boolean :window_patching, :default => false
#      t.string :window_patching_type
#      t.string :window_patching_type_other
#      t.string :window_shape
#      t.string :window_shape_other
#      
#      t.string :die_cut_type
#      t.string :die_cut_type_other
#      t.boolean :folding, :default => false
      t.integer :collating_no
#      t.integer :color_no
#      t.string :color_type
      
      t.integer :quotation_request_no
      t.integer :updated_by
      t.integer :authorized_by
      t.string :status, :default => JobSheet::ACTIVE
      

#      t.string :material_remark
#      t.string :surface_remark
#      t.string :lamination_remark

      t.string :option_size
      
      t.float :window_width, :precision => 10, :scale => 2, :default => 0
      t.float :window_length, :precision => 10, :scale => 2, :default => 0
      t.integer :window_usage, :default => 0
      t.integer :no_of_moq, :default => 0
      t.string :barcode
      t.string :barcode_other
      t.string :shortage
      t.string :pre_print_textbox
#      t.string :glueing_material
#      t.string :stamping_per_box
#      t.string :lamination_type
#      t.integer :lamination_type_joints, :default => 0
#      t.string :flute_type
#      t.string :flute_type_other
#      t.string :flute_material
#      t.string :flute_material_other
      t.string :packing_type
      t.string :packing_type_other
      t.integer :packed_quantity, :default => 0
      t.string :collect_sequence
      t.string :custom_stock_code
      t.string :box_part_no
      t.integer :lot_size_no
      
########################################### start here ##############################################
      t.string :rev, :default => '00'
      t.date :job_sheet_date
      t.string :job_no
      t.string :customer_po_no
            
      t.integer :trade_company_id
      t.date :eta
      t.string :description
      t.string :issue_note
      t.string :requested_by
      t.integer :requested_qty, :default => 0
      
      t.float :internal_dimensen_length, :precision => 10, :scale => 2, :default => 0
      t.float :internal_dimensen_width, :precision => 10, :scale => 2, :default => 0
      t.float :internal_dimensen_height, :precision => 10, :scale => 2, :default => 0
#      t.float :internal_dimensen_tolerance, :precision => 10, :scale => 2, :default => 0
      
      t.integer :size_xs_qty, :default => 0
      t.integer :size_s_qty, :default => 0
      t.integer :size_m_qty, :default => 0
      t.integer :size_l_qty, :default => 0
      t.integer :size_xl_qty, :default => 0
      t.integer:size_xxl_qty, :default => 0
      
      t.integer :printing_xs_qty, :default => 0
      t.integer :printing_s_qty, :default => 0
      t.integer :printing_m_qty, :default => 0
      t.integer :printing_l_qty, :default => 0
      t.integer :printing_xl_qty, :default => 0
      t.integer :printing_xxl_qty, :default => 0
     
      t.string :uv
      t.string :varnish
      t.string :lamination
      t.string :die_cut
      t.string :glueing
      t.string :window
      t.string :wax
      t.string :finishing_other
      t.string :matt_varnish
      
      t.text :ink
      
      t.integer :material_gramme, :default => 0
      t.integer :unit_measurement_id
      t.string :material_type
      
      t.float :paper_width, :precision => 10, :scale => 2, :default => 0
      t.float :paper_length, :precision => 10, :scale => 2, :default => 0
#      t.integer :paper_no_of_ups, :default => 0      
      t.text :trim_size
      t.integer :ratio, :default => 0
      t.integer :ori_size_qty, :default => 0
      
      t.text :remarks
      t.integer :stock_xs_qty, :default => 0
      t.integer :stock_s_qty, :default => 0
      t.integer :stock_m_qty, :default => 0
      t.integer :stock_l_qty, :default => 0
      t.integer :stock_xl_qty, :default => 0
      t.integer :stock_xxl_qty, :default => 0
      
      t.text :customer_ref
      
      t.string :packing_qty
      t.text :mould_no
      t.string :prepared_by
      t.integer :sales_order_id
      t.text :film_no
      t.text :wef
      
      t.timestamps
    end
    add_index :job_sheets, :trade_company_id
    add_index :job_sheets, :unit_measurement_id
    add_index :job_sheets, :sales_order_id
  end
end
