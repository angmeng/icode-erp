class CreateBoms < ActiveRecord::Migration
  def change
    create_table :boms do |t|
      t.integer :status
      t.integer :quotation_request_form_id
      t.string :customer_po_no
      t.integer :prepared_by
      
      t.string :paper
      t.string :original_size
      t.string :trim_size
      t.integer :ratio
      t.integer :paper_product_id
      
      t.text :packing_qty
      t.text :mould_no
      t.string :ecn
      t.text :finishing

      t.timestamps
    end
    add_index :boms, :quotation_request_form_id
  end
end
