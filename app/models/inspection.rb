class Inspection < ActiveRecord::Base 
  validates :building_abbrev, :presence => true
  validates :inspection_date, :presence => true
  validates :floor, :presence => true
  validates :user, :presence => true
  validates :location, :presence => true
  validates :damper_id, :presence => true
  validates :damper_status, :presence => true
  validates :damper_type, :presence => true
  validates :job, :presence => true
  validates :damper_airstream_id, :presence => true
  validates :length, :presence => true
  validates :height, :presence => true
  validates :company, :presence => true
  
  belongs_to :user
  belongs_to :damper_status
  belongs_to :damper_type
  belongs_to :damper_airstream
  belongs_to :job
  belongs_to :company
  
  default_scope :order => ["floor ASC"]
  
  attr_accessible :damper_image, 
                  :damper_image_content_type, 
                  :damper_image_file_size,    
                  :damper_image_second, 
                  :damper_image_second_content_type, 
                  :damper_image_second_file_size,               
                  :building_abbrev,
                  :inspection_date,
                  :location,
                  :damper_id,
                  :damper_status,
                  :job_id,
                  :user_id, 
                  :damper_status_id, 
                  :floor, 
                  :damper_type_id, 
                  :description,
                  :damper_airstream_id,
                  :length,
                  :height,
                  :notes,
                  :tag,
                  :company_id,
                  :unit,
                  :replace,
                  :nonaccessible
                  
  has_attached_file :damper_image,
    :storage => :s3,
    :default_url => "http://placehold.it/300x300.jpg&text=No%20Image",
    :s3_credentials => Rails.root.join('config', 's3_config.yml').to_s,  
    :path => '/inspections/:id/open.jpg'
  
  has_attached_file :damper_image_second,
    :storage => :s3,
    :default_url => "http://placehold.it/300x300.jpg&text=No%20Image",
    :s3_credentials => Rails.root.join('config', 's3_config.yml').to_s,  
    :path => '/inspections/:id/closed.jpg'

  validates_attachment_content_type :damper_image, :content_type => ["image/jpg", "image/jpeg"]
  validates_attachment_content_type :damper_image_second, :content_type => ["image/jpg", "image/jpeg"]

    def damper_image_url_open
        damper_image.url(:medium)
    end
    
    def damper_image_url_closed
        damper_image_second.url(:medium)
    end
end
