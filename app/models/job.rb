class Job < ActiveRecord::Base
  has_many :inspection, :dependent => :delete_all
  has_many :report, :dependent => :delete_all
  
  validates :name,  :presence => true
  validates :address, :presence => true
  validates :finish_date, :presence => true
  validates :start_date, :presence => true
  validates :inspected_by, :presence => true

end
