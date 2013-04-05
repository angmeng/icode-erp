class AddRecoverStatusToQuotationRequestForm < ActiveRecord::Migration
  def change
    change_column :price_controls, :pp_no, :string
    change_column :delivery_orders, :tport_c, :decimal, :precision => 10, :scale => 2, :default => 0.00
     add_column    :quotation_request_forms, :recover_status, :string
    add_column    :product_customers, :currency_id, :integer
    add_column    :product_vendors, :currency_id, :integer
    remove_column :products, :color_grade
    remove_column :products, :version
    remove_column :products, :model
    remove_column :products, :part_no
  end
end
