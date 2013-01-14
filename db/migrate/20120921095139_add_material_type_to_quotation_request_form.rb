class AddMaterialTypeToQuotationRequestForm < ActiveRecord::Migration
  def change
    add_column :quotation_request_forms, :material_type, :string
    add_column :quotation_request_forms, :material_gramme, :integer, :default => 0
    add_column :quotation_request_forms, :material_remark, :string
    add_column :quotation_request_forms, :surface_remark, :string
    add_column :quotation_request_forms, :lamination_remark, :string
    
    add_column :quotation_request_forms, :paper_width, :float, {:default => 0.00, :scale => 2, :precision => 10 }
    add_column :quotation_request_forms, :paper_length, :float, {:default => 0.00, :scale => 2, :precision => 10 }
    add_column :quotation_request_forms, :paper_no_of_ups, :integer, :default => 0.00
    
    add_column :quotation_request_forms, :option_size, :string
    add_column :quotation_request_forms, :ratio, :integer, :default => 0.00
    
    add_column :quotation_request_forms, :window_width, :float, :default => 0.00
    add_column :quotation_request_forms, :window_length, :float, :default => 0.00
    add_column :quotation_request_forms, :window_usage, :integer, :default => 0
    
    add_column :quotation_request_forms, :no_of_moq, :integer, :default => 0
    add_column :quotation_request_forms, :barcode, :string
    add_column :quotation_request_forms, :barcode_other, :string
    add_column :quotation_request_forms, :shortage, :string
    
    add_column :quotation_request_forms, :pre_print_textbox, :string
    add_column :quotation_request_forms, :glueing_material, :string
    
    #Stamping
    add_column :quotation_request_forms, :stamping_per_box,:string
    
    #Lamintation
    add_column :quotation_request_forms, :lamination_type, :string
    add_column :quotation_request_forms, :lamination_type_joints, :integer, :default => 0
    add_column :quotation_request_forms, :flute_type, :string
    add_column :quotation_request_forms, :flute_type_other, :string
    add_column :quotation_request_forms, :flute_material, :string
    add_column :quotation_request_forms, :flute_material_other, :string
    
    #Packing
    add_column :quotation_request_forms, :packing_type, :string
    add_column :quotation_request_forms, :packing_type_other, :string
    add_column :quotation_request_forms, :packed_quantity, :integer, :default => 0
    
    #Collating
    add_column :quotation_request_forms, :collect_sequence, :string
    
    add_column :quotation_request_forms, :user_id, :integer
    
    add_column :quotation_request_forms, :custom_stock_code, :string
    add_column :quotation_request_forms, :box_part_no, :string
    add_column :quotation_request_forms, :lot_size_no, :integer
    
    add_column :quotation_request_forms, :qr_task, :integer
    add_column :quotation_request_forms, :qr_status, :string
    add_column :quotation_request_forms, :director_approved, :boolean, :default => FALSE
    add_column :quotation_request_forms, :send_count, :integer, :default => 0
    
    add_column :quotation_request_forms, :confirmed_by, :integer
  end
end
