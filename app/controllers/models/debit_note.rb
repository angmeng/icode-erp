class DebitNote < ActiveRecord::Base
  before_save :uppercase_text
  before_update :uppercase_text
  
  attr_accessible :account_id, :currency_id, :debit_note_date, :debit_note_no, :debit_type, :status_id, :trade_company_id, :updated_by, :amount
  
  validates :currency_id, :debit_note_date, :debit_note_no, :debit_type, :trade_company_id, :updated_by, :amount, :presence => true
  
  belongs_to :trade_company
  belongs_to :currency
  
  default_scope order("debit_note_no DESC")
  
  def self.db_active(search)
    search.where(:status_id => Status::ACTIVE)
  end
  
  def self.db_kiv(search)
    search.where(:status_id => Status::KEEP_IN_VIEW)
  end
  
  def updater_name
    User.find_by_id(self.updated_by).name
  end
  
  def update_debit_thing(company)
    company.total_amount     -= self.amount
    company.sn_debit_note_no  = self.debit_note_no
    company.save!
  end
  
  def uppercase_text
    self.debit_type.upcase! if self.debit_type.present?
  end
end
