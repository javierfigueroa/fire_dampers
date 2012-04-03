class Inspection < ActiveRecord::Base
  validations :building_abbrev, :presence => true
  validations :inspection_date, :presence => true
  validations :floor, :presence => true
  validations :user, :presence => true
  validations :location, :presence => true
  validations :damper_id, :presence => true
  validations :damper_status, :presence => true
  validations :damper_type, :presence => true
  validations :photo_url, :presence => true
  validations :job, :presence => true
  
  belongs_to :user
  belongs_to :damper_status
  belongs_to :damper_type
  belongs_to :job
end
