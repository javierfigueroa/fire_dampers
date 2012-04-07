class User < ActiveRecord::Base
  has_many :job
  has_many :technician
  has_many :inspection
  has_many :report
  ROLES = %w[technician client regular admin]
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  
  # validates :first_name, :presence => true
  # validates :last_name, :presence => true
  # validates :account_expiration_date, :presence => true
  
  def role?(base_role)
    ROLES.index(base_role.to_s) <= ROLES.index(role)
  end
end
