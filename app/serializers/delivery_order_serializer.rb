class DeliveryOrderSerializer < ActiveModel::Serializer
  attributes :id, :do_no
  has_many :delivery_order_items
end
