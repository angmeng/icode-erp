class JournalVoucherItem < ActiveRecord::Base
  attr_accessible :balance_amount, :document_amount, :document_date, :document_no, :document_type, :fp, :os_amount, :journal_voucher_id
  
  belongs_to :journal_voucher
end
