class User < ActiveRecord::Base
  before_save :uppercase_text
  before_update :uppercase_text
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  
#  :validatable,
  devise :database_authenticatable, :registerable, #:confirmable,
         :recoverable, :rememberable, :trackable, 
         :token_authenticatable, :encryptable, :lockable, :timeoutable, :omniauthable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name, :department_id, :level, :encrypted_password, :password_salt
  
  validates :name, :department_id, :level, :presence => true
  validates :name, :email, :uniqueness => true
  
  belongs_to :department
  
  has_one :purchase_order
  has_many :purchase_requisition_items, :dependent => :destroy
  has_many :sales_order_items, :dependent => :destroy
  
  has_many :roles, :dependent => :destroy
  has_many :inventory_management_systems, :through => :roles
  
  has_one :requested_by, :foreign_key => "requested_by", :class_name => "PurchaseRequisition"
  
  def uppercase_text
    self.name.upcase! if self.name?
  end
  
  ROLE = [
    InventoryManagementSystem::QUOTATION_REQUEST_SHOW, 
#    InventoryManagementSystem::QUOTATION_REQUEST_EDIT
#    InventoryManagementSystem::PURCHASE_ORDER_DELETE,
#    InventoryManagementSystem::PURCHASE_ORDER_PRINTABLE,
#    InventoryManagementSystem::PURCHASE_ORDER_NEW
  ]
  
  LEVEL_ONE   = 1   # Staff
  LEVEL_TWO   = 2   # Supervisor
  LEVEL_THREE = 3   # General Manager
  LEVEL_FIVE  = 5   # Director
  
  scope :ordered_name, order("name")
 
  HEADER_TITLE = [
    'Name',
    'Email',
    'Department',
    'Level',
    'Roles',
    'Action'
  ]
  
  def generate_role(inventory_management_system)
    inventory_management_system.each do |ims|
      roles.create!(:inventory_management_system_id => ims.to_i)
    end
  end

#  def self.searching_keyword(kw)
#    if kw.present?
#      self.where("name like ?", "%#{kw}%") 
#    else
#      self.all
#    end
#  end

  def self.uniq_department
    department = []
    dpms = User.select('DISTINCT department_id');
    if dpms.present?
      dpms.each do |dpm|
        department << [dpm.department.name, dpm.department.id]
      end
    end
    return department
  end
  
  def self.uniq_level
    array = []
    level = User.select('DISTINCT level');
    if level.present?
      level.each do |lvl|
        if lvl.level == User::LEVEL_ONE
          array << ["Level 1", User::LEVEL_ONE]
        elsif lvl.level == User::LEVEL_TWO
          array << ["Level 2", User::LEVEL_TWO]
        elsif lvl.level == User::LEVEL_THREE
          array << ["Level 3", User::LEVEL_THREE]
        elsif lvl.level == User::LEVEL_FIVE
          array << ["Level 5", User::LEVEL_FIVE]
        else
          
        end
      end
    end
    return array
  end
end
