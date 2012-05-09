class User < ActiveRecord::Base
  has_many :job
  has_many :technician
  has_many :inspection
  has_many :report
  belongs_to :company
  ROLES = %w[technician regular admin]
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :token_authenticatable
  before_save :ensure_authentication_token

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, 
  :password, 
  :password_confirmation, 
  :remember_me,
  :company_id,
  :role,
  :first_name,
  :last_name,
  :active,
  :phone
  
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  
  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end
  
   def active_for_authentication?
    #remember to call the super
    #then put our own check to determine "active" state using 
    #our own "is_active" column
    super and self.active?
  end
end
