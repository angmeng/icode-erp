class PaymentReceived < ActiveRecord::Base
  before_save :uppercase_text
  before_update :uppercase_text
  
  attr_accessible :bank, :cheque_amount, :cheque_date, :cheque_no, :outport_cheque, :payment_date, :place, :status_id, :third_party_cheque, :trade_company_id, :updated_by
  
  validates :trade_company_id, :payment_date, :bank, :place, :cheque_amount, :cheque_date, :cheque_amount, :updated_by, :presence => true
  
  has_many :statement_of_accounts, :dependent => :destroy
  
  belongs_to :trade_company
  
  default_scope order("payment_date DESC")
  
  self.per_page = 50
  
  def self.db_active(search)
    search.where(:status_id => DataStatus::ACTIVE)
  end
  
  def self.db_kiv(search)
    search.where(:status_id => DataStatus::KEEP_IN_VIEW)
  end
  
  def payment_received_update_to_statement
    @soa = StatementOfAccount.new(:trade_company_id => self.trade_company_id, :transaction_date => self.payment_date, :transaction_type => "REC", :credit_note_id => 0, :debit_note_id => 0, :payment_received_id => self.id, :delivery_order_id => 0)
    @soa.save!
  end
  
  def uppercase_text
    self.bank.upcase! if self.bank.present?
    self.cheque_no.upcase! if self.cheque_no.present?
    self.place.upcase! if self.place.present?
  end
end
