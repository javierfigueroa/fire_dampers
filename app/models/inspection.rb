class Inspection < ActiveRecord::Base
  belongs_to :user
  belongs_to :damper_status
  belongs_to :damper_type
  belongs_to :job
end
