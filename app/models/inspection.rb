class Inspection < ActiveRecord::Base 
  validates :building_abbrev, :presence => true
  validates :inspection_date, :presence => true
  validates :floor, :presence => true
  validates :technician, :presence => true
  validates :location, :presence => true
  validates :damper_id, :presence => true
  validates :damper_status, :presence => true
  validates :damper_type, :presence => true
  validates :job, :presence => true
  
  belongs_to :technician
  belongs_to :damper_status
  belongs_to :damper_type
  belongs_to :job
  
  attr_accessible :damper_image, 
                  :damper_image_content_type, 
                  :damper_image_file_size,                  
                  :building_abbrev,
                  :inspection_date,
                  :technician,
                  :location,
                  :damper_id,
                  :damper_status,
                  :job
  has_attached_file :damper_image,
    :storage => :s3,
    :s3_credentials => Rails.root.join('config', 's3_inspections.yml').to_s,  
    :path => '/:id/:filename'
    
    def damper_image_url
        damper_image.url(:medium)
    end
end
