class Job < ActiveRecord::Base
  validates :name,  :presence => true
  validates :address, :presence => true,
  validates :finish_date, :presence => true,
  validates :start_date, :presence => true,
  validates :inspected_by, :presence => true

end
