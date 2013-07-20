class OutgoingReject < ActiveRecord::Base
  attr_accessible :currency_id, :outgoing_date, :outgoing_reject_no, :return_note_no, :sales_tax, :trade_company_id, :trade_term_id, :updated_by, :delivery_order_id, :remark, :delivery_order_no, :delivery_order_item_id
  has_many :outgoing_reject_items, :dependent => :destroy
  belongs_to :trade_company
  belongs_to :currency
  belongs_to :trade_term
#  belongs_to :delivery_order
#  belongs_to :delivery_order_item
  
  def self.init_outgoing_reject_items(received_qty, outgoing_reject)
    if received_qty
      received_qty.each do |key, content|
        if content[:rec_qty].present?
          outgoing_reject.outgoing_reject_items.build( :sales_order_item_id => key, :received_qty => content[:rec_qty], :delivery_order_item_id => content[:doi_id] )
          unless outgoing_reject.valid?
            return false, msg = outgoing_reject.errors.full_messages
            break;
          end
        end
      end
      return outgoing_reject
    end
  end
end