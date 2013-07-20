class AddDeliveryOrderNoToOutgoingRejects < ActiveRecord::Migration
  def change
    add_column :outgoing_rejects, :remark, :text, :after => :delivery_order_id
    add_column :outgoing_rejects, :delivery_order_no, :integer, :after => :delivery_order_id
    add_column :outgoing_rejects, :status, :integer, :after => :delivery_order_id, :default => Status::ACTIVE
    add_column :outgoing_reject_items, :outgoing_reject_id, :integer, :after => :client_po
    add_column :outgoing_reject_items, :sales_order_item_id, :integer, :after => :client_po
  end
end