class CreateCostingSheets < ActiveRecord::Migration
  def change
    
    create_table :costing_sheets do |t|
      t.integer :quotation_request_form_id
      
      t.string :prod_size
      t.string :open_size
      t.integer :quantity, :default => 0
      t.integer :color, :default => 0
      
      t.float :paper_size_l, :precision => 2, :scale => 10, :default => 0
      t.float :paper_size_w, :precision => 2, :scale => 10, :default => 0
      t.integer :ratio, :default => 0
      t.float :printing_size_l, :precision => 2, :scale => 10, :default => 0
      t.float :printing_size_w, :precision => 2, :scale => 10, :default => 0
      t.integer :ups, :default => 0
      t.integer :art_card, :default => 0
      t.float :rej_percent, :precision => 2, :scale => 10, :default => 0
      t.float :cost_lb, :precision => 2, :scale => 10, :default => 0
      
      t.float :art_card_pc, :precision => 2, :scale => 10, :default => 0
      t.float :material_cost_usage, :precision => 2, :scale => 10, :default => 0
      t.float :material_cost_rej, :precision => 2, :scale => 10, :default => 0
      t.float :material_cost_lot, :precision => 2, :scale => 10, :default => 0
      t.float :material_cost_pc, :precision => 3, :scale => 10, :default => 0
      
      t.integer :printing_cost, :default => 0
      t.string :printing_cost_mc
      t.float :printing_cost_k, :precision => 2, :scale => 10, :default => 0
      t.float :printing_cost_r, :precision => 2, :scale => 10, :default => 0
      t.float :printing_cost_lot, :precision => 2, :scale => 10, :default => 0
      t.float :printing_cost_pc, :precision => 3, :scale => 10, :default => 0
      
      t.integer :pre_press, :default => 0
      t.float :pre_press_sq, :precision => 2, :scale => 10, :default => 0
      t.float :pre_press_l, :precision => 2, :scale => 10, :default => 0
      t.float :pre_press_w, :precision => 2, :scale => 10, :default => 0
      t.float :pre_press_lot, :precision => 2, :scale => 10, :default => 0
      t.float :pre_press_pc, :precision => 3, :scale => 10, :default => 0
      
      t.float :plate_sq, :precision => 2, :scale => 10, :default => 0.00
      t.float :plate_l, :precision => 2, :scale => 10, :default => 0
      t.float :plate_w, :precision => 2, :scale => 10, :default => 0
      t.float :plate_lot, :precision => 2, :scale => 10, :default => 0
      t.float :plate_pc, :precision => 3, :scale => 10, :default => 0
      
      t.float :uv_k, :precision => 6, :scale => 10, :default => 0
      t.float :uv_r, :precision => 2, :scale => 10, :default => 0
      t.float :uv_lot, :precision => 2, :scale => 10, :default => 0
      t.float :uv_pc, :precision => 3, :scale => 10, :default => 0
      
      t.string :lamination_remark
      t.float :lamination_k, :precision => 6, :scale => 10, :default => 0
      t.float :lamination_r, :precision => 2, :scale => 10, :default => 0.00
      t.float :lamination_lot, :precision => 2, :scale => 10, :default => 0
      t.float :lamination_pc, :precision => 3, :scale => 10, :default => 0
      
      t.float :die_cut_lot, :precision => 2, :scale => 10, :default => 0
      t.float :die_cut_pc, :precision => 3, :scale => 10, :default => 0
      
      t.float :die_cut_labour_k, :precision => 2, :scale => 10, :default => 0
      t.float :die_cut_labour_r, :precision => 2, :scale => 10, :default => 0
      t.float :die_cut_labour_lot, :precision => 2, :scale => 10, :default => 0
      t.float :die_cut_labour_pc, :precision => 3, :scale => 10, :default => 0
      
      t.string :glueing_remark
      t.float :glueing_k, :precision => 2, :scale => 10, :default => 0
      t.float :glueing_r, :precision => 2, :scale => 10, :default => 0
      t.float :glueing_lot, :precision => 2, :scale => 10, :default => 0
      t.float :glueing_pc, :precision => 3, :scale => 10, :default => 0
      
      t.string :gold_remark
      t.float :gold_k, :precision => 4, :scale => 10, :default => 0
      t.float :gold_r, :precision => 2, :scale => 10, :default => 0
      t.float :gold_lot, :precision => 2, :scale => 10, :default => 0
      t.float :gold_pc, :precision => 3, :scale => 10, :default => 0
      
      t.float :packing_cost, :precision => 4, :scale => 10, :default => 0
      t.float :packing_cost_r, :precision => 4, :scale => 10, :default => 0
      t.float :packing_lot, :precision => 2, :scale => 10, :default => 0
      t.float :packing_pc, :precision => 3, :scale => 10, :default => 0
      
      t.float :transport, :precision => 2, :scale => 10, :default => 0
      t.float :transport_r, :precision => 4, :scale => 10, :default => 0
      t.float :transport_lot, :precision => 2, :scale => 10, :default => 0
      t.float :transport_pc, :precision => 3, :scale => 10, :default => 0
      
      t.float :misc_r, :precision => 4, :scale => 10, :default => 0
      t.float :misc_lot, :precision => 2, :scale => 10, :default => 0
      t.float :misc_pc, :precision => 3, :scale => 10, :default => 0
      
      t.float :raw_material_percent, :precision => 2, :scale => 10, :default => 0
      t.float :paper_mt, :precision => 2, :scale => 10, :default => 0
      
      t.float :total_lot, :precision => 2, :scale => 10, :default => 0
      t.float :total_pc, :precision => 3, :scale => 10, :default => 0
      
      t.float :admin_percent, :precision => 2, :scale => 10, :default => 0
      t.float :admin_lot, :precision => 2, :scale => 10, :default => 0
      t.float :admin_pc, :precision => 3, :scale => 10, :default => 0
      
      t.float :grand_total_lot, :precision => 2, :scale => 10, :default => 0
      t.float :grand_total_pc, :precision => 3, :scale => 10, :default => 0
      
      t.float :summary_percent, :precision => 2, :scale => 10, :default => 0
      t.float :summary_lot, :precision => 4, :scale => 10, :default => 0
      t.float :summary_pc, :precision => 3, :scale => 10, :default => 0
      
      t.text :remark
      
      t.date :costing_sheet_date

      t.string :status, :default => "A"
      t.timestamps
    end
    
    add_index :costing_sheets, :quotation_request_form_id
    
  end
end
