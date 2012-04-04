class Technician < ActiveRecord::Base
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :presence => true
  validates :license, :presence => true
  validates :license_expiration, :presence => true
end
