class Inspection < ActiveRecord::Base
  validates :building_abbrev, :presence => true
  validates :inspection_date, :presence => true
  validates :floor, :presence => true
  validates :user, :presence => true
  validates :location, :presence => true
  validates :damper_id, :presence => true
  validates :damper_status, :presence => true
  validates :damper_type, :presence => true
  validates :photo_url, :presence => true
  validates :job, :presence => true
  
  belongs_to :user
  belongs_to :damper_status
  belongs_to :damper_type
  belongs_to :job
end
