class DebitNote < ActiveRecord::Base
  before_save :uppercase_text
  before_update :uppercase_text
  
  attr_accessible :account_id, :currency_id, :debit_note_date, :debit_note_no, :debit_type, :status_id, :trade_company_id, :updated_by, :amount, :remark
  
  validates :currency_id, :debit_note_date, :debit_note_no, :debit_type, :trade_company_id, :updated_by, :amount, :presence => true
  
  has_one :statement_of_account
  
  belongs_to :trade_company
  belongs_to :currency
  
  default_scope order("debit_note_no DESC")
  
  self.per_page = 50
  
  def self.db_active(search)
    search.where(:status_id => DataStatus::ACTIVE)
  end
  
  def self.db_kiv(search)
    search.where(:status_id => DataStatus::KEEP_IN_VIEW)
  end
  
  def updater_name
    User.find_by_id(self.updated_by).name
  end
  
  def uppercase_text
    self.debit_type.upcase! if self.debit_type.present?
  end

  def update_debit_thing(company)
    company.sn_debit_note_no  = self.debit_note_no
    company.save!
    @soa = StatementOfAccount.new(:trade_company_id => self.trade_company_id, :transaction_date => self.debit_note_date, :transaction_type => "DN", :credit_note_id => 0, :debit_note_id => self.id, :payment_received_id => 0, :delivery_order_id => 0)
    @soa.save!
  end
end