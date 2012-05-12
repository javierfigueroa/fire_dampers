class Company < ActiveRecord::Base
  attr_accessible :logo_image, 
                  :logo_image_content_type, 
                  :logo_image_file_size,                  
                  :name,
                  :address,
                  :city,
                  :state,
                  :zipcode,
                  :phone,
                  :fax
  has_attached_file :logo_image,
    :storage => :s3,
    :default_url => "http://placehold.it/350x150.jpg&text=Missing%20Company%20Logo",
    :s3_credentials => Rails.root.join('config', 's3_companies.yml').to_s,  
    :path => '/:id/:filename'
end
