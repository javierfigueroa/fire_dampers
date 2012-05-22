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
  belongs_to :damper_airstream
  belongs_to :job
  belongs_to :company
  
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
                  :technician_id, 
                  :damper_status_id, 
                  :floor, 
                  :damper_type_id, 
                  :description,
                  :damper_airstream_id,
                  :length,
                  :height,
                  :notes,
                  :tag,
                  :unit
                  
  has_attached_file :damper_image,
    :storage => :s3,
    :default_url => "http://placehold.it/300x300.jpg&text=No%20Image",
    :s3_credentials => Rails.root.join('config', 's3_inspections.yml').to_s,  
    :path => '/:id/:filename'
  
  has_attached_file :damper_image_second,
    :storage => :s3,
    :default_url => "http://placehold.it/300x300.jpg&text=No%20Image",
    :s3_credentials => Rails.root.join('config', 's3_inspections.yml').to_s,  
    :path => '/:id/:filename'
    
    def damper_image_url
        damper_image.url(:medium)
    end
end
