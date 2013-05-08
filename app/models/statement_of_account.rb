class StatementOfAccount < ActiveRecord::Base
  attr_accessible :credit_note_id, :debit_note_id, :trade_company_id, :transaction_date, :transaction_type, :payment_received_id, :delivery_order_id, :fp, :os_amount
  
  belongs_to :credit_note
  belongs_to :debit_note
  belongs_to :payment_received
  belongs_to :delivery_order
  
  validates :trade_company_id, :transaction_date, :presence => true
  
  FULL_PAYMENT    = "F"
  PARTIAL_PAYMENT = "P"
  NULL_PAYMENT    = "N"
  CREDIT_NOTE     = "CN"
  DEBIT_NOTE      = "DN"
  INVOICE         = "INV"
  
  default_scope order("transaction_date")
  
  def self.transacted(statement)
    case statement.transaction_type
    when StatementOfAccount::CREDIT_NOTE
      "CN #{statement.credit_note.credit_note_no}"  if statement.credit_note.present?
    when StatementOfAccount::DEBIT_NOTE
      "DN #{statement.debit_note.debit_note_no}"    if statement.debit_note.present?
    when StatementOfAccount::INVOICE
      "INV #{statement.delivery_order.do_no}"       if statement.delivery_order.present?
    else
      "-"
    end
  end
  
  def self.transacted_date(statement)
    case statement.transaction_type
    when StatementOfAccount::CREDIT_NOTE
      "#{statement.credit_note.credit_note_date.strftime('%d-%m-%Y')}"  if statement.credit_note.present?
    when StatementOfAccount::DEBIT_NOTE
      "#{statement.debit_note.debit_note_date.strftime('%d-%m-%Y')}"    if statement.debit_note.present?
    when StatementOfAccount::INVOICE
      "#{statement.delivery_order.do_date.strftime('%d-%m-%Y')}"       if statement.delivery_order.present?
    else
      "-"
    end
  end
  
  def self.transacted_amount(statement)
    case statement.transaction_type
    when StatementOfAccount::CREDIT_NOTE
      "#{statement.credit_note.amount}"  if statement.credit_note.present?
    when StatementOfAccount::DEBIT_NOTE
      "#{statement.debit_note.amount}"    if statement.debit_note.present?
    when StatementOfAccount::INVOICE
      if statement.delivery_order.present?
        if statement.delivery_order.delivery_order_items.present?
          total_amount = statement.delivery_order.delivery_order_items.map(&:delivery_qty).sum
          "#{total_amount}"      
        end
      end
    else
      "-"
    end
  end
  
#  def credit_note?
#    transaction_type == StatementOfAccount::CREDIT_NOTE
#  end
#  
#  def credit_note?
#    transaction_type == StatementOfAccount::CREDIT_NOTE
#  end
end
