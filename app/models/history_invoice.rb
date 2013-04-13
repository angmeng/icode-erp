class HistoryInvoice < ActiveRecord::Base
  attr_accessible :delivery_order_id

  belongs_to :delivery_order




end
