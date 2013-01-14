class CreateQuotationRequestForms < ActiveRecord::Migration
  def change
    create_table :quotation_request_forms do |t|
      t.string  :customer_name
      t.date    :qrf_date
      t.string  :description
      
      t.float   :internal_dimensen_length, :default => 0
      t.float   :internal_dimensen_width, :default => 0
      t.float   :internal_dimensen_height, :default => 0
      t.float   :internal_dimensen_tolerance, :default => 0
      
      t.float   :external_dimensen_length, :default => 0
      t.float   :external_dimensen_width, :default => 0
      t.float   :external_dimensen_height, :default => 0
      t.float   :external_dimensen_tolerance, :default => 0
      
      t.float   :open_size_length, :default => 0
      t.float   :open_size_width, :default => 0
      t.string  :color
      t.string  :material
      t.string  :finishing
      
      t.string  :varnish
      t.string  :varnish_type
      t.string  :uv_coat
      t.string  :calendaring_coat
      t.string  :matt_coat
      t.boolean :wax
      t.string  :lamination
      t.boolean :window_patching
      t.string  :window_patching_type
      t.string  :window_patching_type_other
      t.string  :window_shape
      t.string  :window_shape_other
      t.string  :die_cut_type
      t.string  :die_cut_type_other
      t.boolean :triming
      t.boolean :folding
      t.integer :collating_no
      t.integer :color_no
      t.string  :color_type
      
      t.integer :quantity, :default => 0
      t.float   :unit_price, :default => 0
      t.string  :remarks
      t.integer :quotation_request_no
      t.integer :updated_by
      t.integer :authorized_by
      t.string  :status
      t.string  :status_remark
      t.integer :trade_company_id
      t.integer :unit_measurement_id

      t.timestamps
    end
  end
end
