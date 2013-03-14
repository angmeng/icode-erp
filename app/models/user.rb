class User < ActiveRecord::Base
  before_save   :uppercase_text
  before_update :uppercase_text
  
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :validatable, :confirmable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :token_authenticatable, :encryptable, :lockable, :timeoutable, :omniauthable
  # Setup accessible (or protected) attributes for your model
  attr_accessible  :password, :password_confirmation, :remember_me, :encrypted_password, :password_salt, :name, :department_id, :job_title, :status, :admin, :level_two, :level_three, :level
  
  validates :name, :job_title, :department_id, :presence => true
  validates :name, :uniqueness => true
  
  has_one  :purchase_order
  has_one  :requested_by, :foreign_key => "requested_by", :class_name => "PurchaseRequisition"
  has_many :purchase_requisition_items, :dependent => :destroy
  has_many :sales_order_items, :dependent => :destroy
  has_many :roles, :dependent => :destroy
  has_many :inventory_management_systems, :through => :roles
  has_many :quotation_request_forms, :dependent => :destroy
  has_many :price_control_items, :dependent => :destroy
  has_many :price_controls, :dependent => :destroy
  has_many :prs, :foreign_key => "tasks",   :class_name => "PurchaseRequisition"
  has_many :qrs, :foreign_key => "qr_task", :class_name => "QuotationRequestForm"
  
  belongs_to :applicant, :foreign_key => "report_to", :class_name => "User"
  belongs_to :department
  
  LEVEL_ONE     = 1   # Staff
  LEVEL_TWO     = 2   # Supervisor
  LEVEL_THREE   = 3   # General Manager
  LEVEL_FIVE    = 5   # Director
  
  ACTIVE        = "ACTIVE"
  KEEP_IN_VIEW  = "KIV"
  
  default_scope order("admin DESC, name")
  
  self.per_page = 50
  
  scope :users_active, where("status = ?", User::ACTIVE)
  
  def self.search_users(search)
    search.where("status = ?", User::ACTIVE)
  end
  
  def self.search_users_kiv(search)
    search.where("status = ?", User::KEEP_IN_VIEW)
  end
  
  def uppercase_text
    self.name.upcase!
    self.job_title.upcase!
  end

  def is_admin?
    admin == true
  end
  
  def has_level_two?
    level_two.present?
  end
  
  def has_level_three?
    level_three.present?
  end
  
#  def self.clearing
#    ActiveRecord::Base.connection.execute("TRUNCATE TABLE product_categories")
#    ActiveRecord::Base.connection.execute("TRUNCATE TABLE product_comboboxes")
#    ActiveRecord::Base.connection.execute("TRUNCATE TABLE product_fields")
#    ActiveRecord::Base.connection.execute("TRUNCATE TABLE product_vendors")
#    ActiveRecord::Base.connection.execute("TRUNCATE TABLE products")
#    ActiveRecord::Base.connection.execute("TRUNCATE TABLE purchase_requisitions")
#    ActiveRecord::Base.connection.execute("TRUNCATE TABLE purchase_requisition_items")
#    ActiveRecord::Base.connection.execute("TRUNCATE TABLE sales_tax_exemptions")
#    ActiveRecord::Base.connection.execute("TRUNCATE TABLE sales_tax_exemption_barangs")
#    ActiveRecord::Base.connection.execute("TRUNCATE TABLE temporary_sources")
#    ActiveRecord::Base.connection.execute("TRUNCATE TABLE users")
#    user = User.new(:name => "DIRECTOR", :password => '12345678', :password_confirmation => "12345678" , :department_id => 1, :job_title => "Director", :admin => true, :level => UserLevel::LEVEL_FIVE)
#    user.save!
#  end
end
