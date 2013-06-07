class StatementOfAccount < ActiveRecord::Base
  before_save :uppercase_text
  before_update :uppercase_text
  
  attr_accessible :credit_note_id, :debit_note_id, :trade_company_id, :transaction_date, :transaction_type, :receipt_id, :delivery_order_id, :fp, :os_amount, :document_amount, :balance_amount, :parent_id
  
  belongs_to :credit_note
  belongs_to :debit_note
  belongs_to :receipt
  belongs_to :delivery_order
  belongs_to :trade_company
  
  has_many :receipt_statement_lines
  has_many :receipts, :through => :receipt_statement_lines
  
  has_many   :children, :foreign_key => "parent_id", :class_name => "StatementOfAccount", :dependent => :destroy
  belongs_to :parent,   :foreign_key => "parent_id", :class_name => "StatementOfAccount"
  
  validates :trade_company_id, :transaction_date, :presence => true
  
  FULL_PAYMENT    = "F"
  PARTIAL_PAYMENT = "P"
  NULL_PAYMENT    = "N"
  TEMP_PAYMENT    = "T"
  CREDIT_NOTE     = "CN"
  DEBIT_NOTE      = "DN"
  INVOICE         = "INV"
  RECEIPT         = "REC"
  
  default_scope order("transaction_date")
  
  def self.transacted_type(statement)
    case statement.transaction_type
    when StatementOfAccount::CREDIT_NOTE
      "CN" if statement.credit_note.present?
    when StatementOfAccount::DEBIT_NOTE
      "DN" if statement.debit_note.present?
    when StatementOfAccount::INVOICE
      "INV" if statement.delivery_order.present?
    else
      "-"
    end
  end
  
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
  
  def self.update_fp(statement)
    statement.each do |st|
      if st.fp == StatementOfAccount::TEMP_PAYMENT
        st.update_attributes!(:fp => StatementOfAccount::NULL_PAYMENT)
      else
        st.update_attributes!(:fp => StatementOfAccount::TEMP_PAYMENT)
      end
    end
  end
    
  def uppercase_text
    self.fp.upcase! if self.fp.present?
  end
  
#  def credit_note?
#    transaction_type == StatementOfAccount::CREDIT_NOTE
#  end
#  
#  def credit_note?
#    transaction_type == StatementOfAccount::CREDIT_NOTE
#  end
end
