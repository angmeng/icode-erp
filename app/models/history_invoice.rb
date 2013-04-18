class HistoryInvoice < ActiveRecord::Base
  attr_accessible :delivery_order_id , :created_date

  belongs_to :delivery_order




end
