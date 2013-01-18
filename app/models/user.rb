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
  attr_accessible  :password, :password_confirmation, :remember_me, :encrypted_password, :password_salt, :name, :department_id, :job_title, :status, :admin, :level_two, :level_three
  
  validates :name, :job_title, :department_id, :presence => true
  validates :name, :uniqueness => true
  
  has_one  :purchase_order
  has_one  :requested_by, :foreign_key => "requested_by", :class_name => "PurchaseRequisition"
  has_one  :lv_two  , :foreign_key => "level_two", :class_name => "User"
  has_one  :lv_three, :foreign_key => "level_three", :class_name => "User"
  has_many :purchase_requisition_items, :dependent => :destroy
  has_many :sales_order_items, :dependent => :destroy
  has_many :roles, :dependent => :destroy
  has_many :inventory_management_systems, :through => :roles
  has_many :quotation_request_forms, :dependent => :destroy
  has_many :price_control_items, :dependent => :destroy
  has_many :price_controls, :dependent => :destroy
  
  belongs_to :applicant, :foreign_key => "report_to", :class_name => "User"
  belongs_to :user, :foreign_key => "level_two", :class_name => "User"
  belongs_to :user, :foreign_key => "level_three", :class_name => "User"
  
  has_many :prs, :foreign_key => "tasks", :class_name => "PurchaseRequisition"
  has_many :qrs, :foreign_key => "qr_task", :class_name => "QuotationRequestForm"
  
  belongs_to :department
  
  LEVEL_ONE   = 1   # Staff
  LEVEL_TWO   = 2   # Supervisor
  LEVEL_THREE = 3   # General Manager
  LEVEL_FIVE  = 5   # Director
  
#  ACTIVE = "ACTIVE"
#  KEEP_IN_VIEW = "KIV"
  
  default_scope order("admin")
  scope :users_active, where("status = ?", DataStatus::ACTIVE)
  def self.search_users(search)
    search.where("status = ?", DataStatus::ACTIVE)
  end
  
  def uppercase_text
    self.name.upcase! if self.name?
    self.job_title.upcase! if self.job_title?
  end
  
  
  
#  def self.ordered_level(search)
#    search.order("level DESC").where(:status => User::ACTIVE)
#  end
  
#  def self.ordered_level_kiv(search)
#    search.order("level DESC").where(:status => User::KEEP_IN_VIEW)
#  end
  
#  def self.ordered_name
#    order("name").where(:status => User::ACTIVE)
#  end
  
  def generate_role(inventory_management_system)
    inventory_management_system.each do |ims|
      roles.create!(:inventory_management_system_id => ims.to_i)
    end
  end

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
  
  def self.uniq_report_to
    report = []
    rpts = User.select('DISTINCT report_to');
    if rpts.present?
      rpts.each do |rpt|
        unless rpt.report_to.blank? or rpt.report_to == 0
          username = User.find(rpt.report_to).name 
          report << [username, rpt.report_to]
        end
      end
    end
    return report
  end
  
  def self.is_boss(user)
    real_user = User.find_by_id(user.id)
    if real_user.level == User::LEVEL_FIVE
      return true
    else
      return false
    end
  end
  
 
  
  def self.clearing
#    ActiveRecord::Base.connection.execute("TRUNCATE TABLE inventory_histories")
#    ActiveRecord::Base.connection.execute("TRUNCATE TABLE product_categories")
#    ActiveRecord::Base.connection.execute("TRUNCATE TABLE product_prices")
#    ActiveRecord::Base.connection.execute("TRUNCATE TABLE product_vendors")
#    ActiveRecord::Base.connection.execute("TRUNCATE TABLE products")
#    ActiveRecord::Base.connection.execute("TRUNCATE TABLE purchase_order_item_lines")
#    ActiveRecord::Base.connection.execute("TRUNCATE TABLE purchase_orders")
#    ActiveRecord::Base.connection.execute("TRUNCATE TABLE purchase_requisition_items")
#    ActiveRecord::Base.connection.execute("TRUNCATE TABLE purchase_requisitions")
#    ActiveRecord::Base.connection.execute("TRUNCATE TABLE receive_note_items")
#    ActiveRecord::Base.connection.execute("TRUNCATE TABLE receive_notes")
#    ActiveRecord::Base.connection.execute("TRUNCATE TABLE roles")
#    ActiveRecord::Base.connection.execute("TRUNCATE TABLE sales_tax_exemption_items")
#    ActiveRecord::Base.connection.execute("TRUNCATE TABLE sales_tax_exemptions")
#    ActiveRecord::Base.connection.execute("TRUNCATE TABLE temporary_sources")
#    ActiveRecord::Base.connection.execute("TRUNCATE TABLE temporary_tarif_codes")
#    ActiveRecord::Base.connection.execute("TRUNCATE TABLE trade_companies")
#    ActiveRecord::Base.connection.execute("TRUNCATE TABLE users")

    user = User.new(:name => "DIRECTOR", :password => '12345678', :password_confirmation => "12345678" , :department_id => 1, :job_title => "Director", :admin => true)
    user.save!
  end
end
