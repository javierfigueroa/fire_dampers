class User < ActiveRecord::Base
  has_many :job
  has_many :technician
  has_many :inspection
  has_many :report
  belongs_to :company
  ROLES = %w[technician regular admin]
  REGULAR_ROLES = %w[technician regular]
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

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
  :phone,
  :license_image, 
  :license_image_content_type, 
  :license_image_file_size,
  :license,
  :license_expiration

  has_attached_file :license_image,
    :storage => :s3,
    :default_url => "http://placehold.it/300x300.jpg&text=No%20Image",
    :s3_credentials => Rails.root.join('config', 's3_config.yml').to_s,  
    :path => '/technicians/:id/:filename'
  
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  
  validates_attachment_content_type :license_image, :content_type => ["image/jpg", "image/jpeg"]
  
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
