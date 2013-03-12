class PaymentReceived < ActiveRecord::Base
  before_save :uppercase_text
  before_update :uppercase_text
  
  attr_accessible :bank, :cheque_amount, :cheque_date, :cheque_no, :outport_cheque, :payment_date, :place, :status_id, :third_party_cheque, :trade_company_id, :updated_by
  
  validates :trade_company_id, :payment_date, :bank, :place, :cheque_amount, :cheque_date, :cheque_amount, :updated_by, :presence => true
  
  belongs_to :trade_company
  
  default_scope order("payment_date DESC")
  
  def self.db_active(search)
    search.where(:status_id => Status::ACTIVE)
  end
  
  def self.db_kiv(search)
    search.where(:status_id => Status::KEEP_IN_VIEW)
  end
  
  def uppercase_text
    self.bank.upcase! if self.bank.present?
    self.place.upcase! if self.place.present?
  end
end
