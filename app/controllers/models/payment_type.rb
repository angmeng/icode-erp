class PaymentType < ActiveRecord::Base
  attr_accessible :desc, :name
  
  validates :name, :uniqueness => true
  
  DEBTOR = 1
  OTHER_DEBTOR = 2
  CREDITOR = 3
  OTHER_CREDITOR = 4
  
  has_one :trade_company
  
  def self.ordered
    order("name").all
  end
end
