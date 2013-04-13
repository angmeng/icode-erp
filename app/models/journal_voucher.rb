class JournalVoucher < ActiveRecord::Base
  attr_accessible :credit_amount, :debit_amount, :jv_date, :jv_no, :particular, :trade_company_id, :updated_by, :status_id
  
  has_many :journal_voucher_items, :dependent => :destroy
end
