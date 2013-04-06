class InventoryIssue < ActiveRecord::Base
  attr_accessible :description, :in_out
  
  has_many :inventory_histories, :dependent => :destroy
  
  validates :description, :uniqueness => true
  
  def self.issues_in
    order("description").where(:in_out => "IN")
  end
#  
  def self.issues_out
    order("description").where(:in_out => "OUT")
  end
  
  RECEIVED_NOTE                 = 1
  PRODUCTION_RETURN             = 2
  RETURN_STOCK_FORM             = 3
  REJECT_FOR_REWORK_AND_RETURN  = 4
  BOM_PLAN_TO_PRODUCTION        = 5
  REQUEST_FOR_SAMPLE            = 6
  ON_LOAN                       = 7
  EXPIRED_SCRAF_DAMAGED         = 8
  NEW_PRODUCT                   = 9
  TRANSFER_NOTE                 = 10
  FINISH_GOODS                  = 11
  
end

