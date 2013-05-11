class Receipt < ActiveRecord::Base
  before_save   :uppercase_text
  before_update :uppercase_text
  
  before_save :cash_and_cheque
    
  attr_accessible :cash_amount, :cheque_amount, :journal_voucher_no, :receipt_date, :receipt_no, :remark, :total_amount, :trade_company_id, :updated_by, :status_id, :payment_received_id, :payment_date, :bank, :place, :cheque_no, :cheque_date, :outport_cheque, :third_party_cheque
  
  validates :receipt_no, :receipt_date, :trade_company_id, :cash_amount, :cheque_amount, :updated_by, :payment_date, :bank, :place, :cheque_no, :cheque_date, :presence => true
  
  belongs_to :trade_company
  
#  has_many :receipt_items, :dependent => :destroy
  has_many :receipt_statement_lines, :dependent => :destroy
  has_many :statement_of_accounts, :through => :receipt_statement_lines
    

  
  default_scope order("receipt_no DESC")
  
  self.per_page = 50
  
  def self.db_active(search)
    search.where(:status_id => DataStatus::ACTIVE)
  end
  
  def self.db_kiv(search)
    search.where(:status_id => DataStatus::KEEP_IN_VIEW)
  end
  
  def update_to_statement(company)
    company.update_attributes!(:sn_receipt_no => self.receipt_no)
  end
  
  def uppercase_text
    self.bank.upcase!       if self.bank.present?
    self.place.upcase!      if self.place.present?
    self.cheque_no.upcase!  if self.cheque_no.present?
  end
  
  private
  def cash_and_cheque
    self.total_amount = self.cash_amount.to_f + self.cheque_amount.to_f
  end
end
