class Technician < ActiveRecord::Base
  attr_accessible :license_image, 
                  :license_image_content_type, 
                  :license_image_file_size,
                  :first_name,
                  :last_name,
                  :email,
                  :license,
                  :license_expiration,
                  :phone,
                  :user_id
  has_attached_file :license_image,
    :storage => :s3,
    :s3_credentials => Rails.root.join('config', 's3_config.yml').to_s,  
    :path => '/technicians/:id/:filename'
  
  validates_attachment_content_type :license_image, :content_type => ["image/jpg", "image/jpeg", "image/png"]
  
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true
  validates :license, :presence => true
  validates :license_expiration, :presence => true
end
