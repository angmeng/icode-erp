class AddDoDateToDeliveryOrder < ActiveRecord::Migration
  def change
    add_column :delivery_orders, :do_date, :date
    
    add_column :product_categories, :status, :string, :default => "Active"
    add_column :product_categories, :exist_field, :boolean, :default => false
    add_column :product_categories, :refer_category_id, :integer
    add_column :product_categories, :level, :integer, :default => 0
    
    add_column :products, :status, :string, :default => 'Active'
    add_column :products, :gsm, :integer, :default => 0
    add_column :products, :width, :float, :default => 0.00, :precision => 2, :scale => 10
    add_column :products, :width_um, :string
    add_column :products, :length, :float, :default => 0.00, :precision => 2, :scale => 10
    add_column :products, :length_um, :string
    add_column :products, :height, :float, :default => 0.00, :precision => 2, :scale => 10
    add_column :products, :height_um, :string
    add_column :products, :tickness, :float, :default => 0.00, :precision => 2, :scale => 10
    add_column :products, :tickness_um, :string
    add_column :products, :origin, :string
    add_column :products, :brand, :string
    add_column :products, :grade, :string
    add_column :products, :packing_method, :string
    add_column :products, :packing_qty, :float, :default => 0.00, :precision => 2, :scale => 10
    add_column :products, :container_no, :string
    add_column :products, :seal_no, :string
    add_column :products, :despatch_advise, :string
    add_column :products, :size, :string
    add_column :products, :model_no, :string
    add_column :products, :reorder_no, :string
    add_column :products, :art_no, :string
    add_column :products, :ref_no, :string
    add_column :products, :work_order_no, :string
    add_column :products, :mfg_date, :date
    add_column :products, :exp_date, :date
    add_column :products, :film_no, :string
    add_column :products, :bar_code, :string
    add_column :products, :lot_no, :string
    add_column :products, :item_code, :string
    add_column :products, :part_code, :string
    add_column :products, :pantone_code, :string
    add_column :products, :color, :string
    add_column :products, :serial_no, :string
    add_column :products, :warranty, :string
    add_column :products, :capacity, :string
    add_column :products, :diameter, :float, :default => 0.00, :precision => 2, :scale => 10
    add_column :products, :voltage, :integer, :default => 0
    add_column :products, :watt, :integer, :default => 0
    add_column :products, :pin, :integer, :default => 0
    add_column :products, :ampere, :integer, :default => 0
    add_column :products, :hp, :float, :default => 0.00, :precision => 2, :scale => 10
    add_column :products, :hz, :float, :default => 0.00, :precision => 2, :scale => 10    
    add_column :products, :pureness, :float, :default => 0.00, :precision => 2, :scale => 10
    add_column :products, :ton, :float, :default => 0.0000, :precision => 4, :scale => 10
    add_column :products, :consignee, :string
    add_column :products, :destination, :string
    add_column :products, :process, :string
    add_column :products, :buffer_stock, :integer
    add_column :products, :mould_no, :string
    add_column :products, :sales_tax_exemption_barang_id, :integer
    
    add_column :trade_companies, :website, :string
    add_column :trade_companies, :certification, :string
    add_column :trade_companies, :performance_monitoring, :boolean
    add_column :trade_companies, :tel_area_code_one, :string
    add_column :trade_companies, :tel_area_code_two, :string
    add_column :trade_companies, :fax_area_code, :string
    add_column :trade_companies, :postcode_one, :integer
    add_column :trade_companies, :city_one, :string
    add_column :trade_companies, :state_one, :string
    add_column :trade_companies, :country_one, :string
    add_column :trade_companies, :postcode_two, :integer
    add_column :trade_companies, :city_two, :string
    add_column :trade_companies, :state_two, :string
    add_column :trade_companies, :country_two, :string
    
    rename_column :sales_tax_exemptions, :ste_no, :running_no
    add_column    :sales_tax_exemptions, :type_of_exemption, :string
    add_column    :sales_tax_exemptions, :company_type, :string
    
    add_column    :sales_orders, :lot_no, :string
    add_column    :sales_orders, :mfg_date, :date
    add_column    :sales_orders, :exp_date, :date
    
  end
end
