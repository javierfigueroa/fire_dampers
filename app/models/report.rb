class Report < ActiveRecord::Base
   attr_accessible :cover_image, 
                  :cover_image_content_type, 
                  :cover_image_file_size,
                  :user_id,
                  :job_id
   has_attached_file :cover_image,
    :storage => :s3,
    :s3_credentials => Rails.root.join('config', 's3_reports.yml').to_s,  
    :path => '/:id/images/:filename'
                  
  belongs_to :job
end
