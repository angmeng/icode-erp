class Contact < ActiveRecord::Base
  before_save :uppercase_text
  before_update :uppercase_text
  
  attr_accessible :department, :email, :name, :phone_area_code, :phone_no, :trade_company_id, :mobile_area_code, :mobile_no
  
  belongs_to :trade_company
  
  validates :department, :name, :phone_area_code, :phone_no, :presence => true
  validates :email, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :messages => "Email is invalid." }, :allow_blank => true
  validates :phone_area_code, :mobile_area_code, :length => { :in => 2..3 }, :allow_blank => true
  validates :phone_no, :mobile_no,               :length => { :in => 7..8 }, :allow_blank => true
  
  def uppercase_text
    self.department.upcase! if self.department.present?
    self.name.upcase! if self.name.present?
  end
  
  def self.destroy_contacts(destroy_contact)
    destroy_contact.each do |des|
      Contact.find(des).destroy
    end
  end
end
