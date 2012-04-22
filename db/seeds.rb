# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# Create Test Users
# Admin.find_or_create_by_email(
  # :email => "test@test.com",
  # :password => 'mainloop2012'
# )
 # t.string :name
      # t.string :logo
      # t.text :address
      # t.string :city
      # t.string :state
      # t.string :zipcode
      # t.string :phone
      # t.string :fax

company = Company.find_or_create_by_name(
    :name => "Sheet Metal Experts, Inc.",
    :address => "8986 N.W. 105th Way",
    :city => "Medley",
    :state => "Florida", 
    :zipcode => "33178",
    :phone => "(305) 805-2019",
    :fax => "(305) 805-2038"            
)

admin = User.find_or_create_by_email(
  :email => "admin@mainloop.us",
  :password => 'mainloop2012',
  :role => "admin"
)

regular = User.find_or_create_by_email(
  :email => "regular@mainloop.us",
  :password => 'test123',
  :role => "regular",
  :company_id => company.id
)

regular2 = User.find_or_create_by_email(
  :first_name => "Test Client First Name",
  :last_name => "Test Client Last Name",
  :email => "regular2@mainloop.us",
  :password => 'test123',
  :role => "regular"
)

tech = User.find_or_create_by_email(
  :first_name => "Test Technician First Name 0",
  :last_name => "Test Technician Last Name 0",
  :email => "tech@mainloop.us",
  :password => 'test123'
)

Technician.find_or_create_by_email(
  :first_name => "Test Technician First Name",
  :last_name => "Test Technician Last Name",
  :email => "tech@mainloop.us", 
  :phone => "478273487293847",
  :license => 10000000+rand(10000000),
  :license_expiration => 1.year.from_now,
  :user_id => regular.id 
)

admin = User.find_by_email("admin@mainloop.us")
admin.role = "admin"
admin.save!

regular = User.find_by_email("regular@mainloop.us")
regular.role = "regular"
regular.company_id = company.id
regular.save!

regular2 = User.find_by_email("regular2@mainloop.us")
regular2.role = "regular"
regular2.save!

# tech = User.find_by_email("tech@mainloop.us")
# tech.role = "tech"
# tech.save!

# Damper Types
# APW = Access Panel Wall
# ATF = Access thru Flex
# ATR = Access thru Floor
# DID = Damper in Diffuser
# DTF = Down thru Floor
# ECD = Electric Combination Damper EFD = Electric Fire Damper
# ESD = Electric Smoke Damper
# FD = Fire Damper
# VINE = Visually Identified Not Exercised DNR = Disabled - Not Required
# FD / ETL = Fire Damper Electric Thermo Link FNR = Failed Needs Repairs
# FRFD = Fire Rated Flanged Door
# PCD = Pneumatic Combination Damper PSD = Pneumatic Smoke Damper
# R/D = Rolling Door
# SLR = See Repair List
# O/D = Over Door L.L. = Lower Level

DamperType.find_or_create_by_abbrev(:abbrev => "APW", :description => "Access Panel Wall")
DamperType.find_or_create_by_abbrev(:abbrev => "ATF", :description => "Access thru Flex")
DamperType.find_or_create_by_abbrev(:abbrev => "ATR", :description => "Access thru Floor")
DamperType.find_or_create_by_abbrev(:abbrev => "DID", :description => "Damper in Diffuser")
DamperType.find_or_create_by_abbrev(:abbrev => "DTF", :description => "Down thru Floor")
DamperType.find_or_create_by_abbrev(:abbrev => "ECD", :description => "Electric Combination Damper EFD = Electric Fire Damper")
DamperType.find_or_create_by_abbrev(:abbrev => "ESD", :description => "Electric Smoke Damper")
DamperType.find_or_create_by_abbrev(:abbrev => "FD", :description => "Fire Damper")
DamperType.find_or_create_by_abbrev(:abbrev => "VINE", :description => "Visually Identified Not Exercised DNR = Disabled - Not Required")
DamperType.find_or_create_by_abbrev(:abbrev => "FD / ETL", :description => "Fire Damper Electric Thermo Link FNR = Failed Needs Repairs")
DamperType.find_or_create_by_abbrev(:abbrev => "FRFD", :description => "Fire Rated Flanged Door")
DamperType.find_or_create_by_abbrev(:abbrev => "PCD", :description => "Pneumatic Combination Damper PSD = Pneumatic Smoke Damper")
DamperType.find_or_create_by_abbrev(:abbrev => "R/D", :description => "Rolling Door")
DamperType.find_or_create_by_abbrev(:abbrev => "SLR", :description => "See Repair List")
DamperType.find_or_create_by_abbrev(:abbrev => "O/D", :description => "Over Door L.L. = Lower Level")

# Damper Statuses
# OK pass
# FAIL fail
DamperStatus.find_or_create_by_abbrev(:abbrev => "OK", :description => "Passed")
DamperStatus.find_or_create_by_abbrev(:abbrev => "FAIL", :description => "Failed")

# Test Jobs
25.times do |i|
  Job.find_or_create_by_name(
  :name => "Test Job " + i.to_s,
  :address => "Test Address 12345 nw 123 st " + i.to_s, 
  :start_date => Time.now, 
  :finish_date => i.days.from_now, 
  :inspected_by => "Test Report Inspector " + i.to_s, 
  :contact_first_name => "Test First Name " + i.to_s,
  :contact_phone => "478273487293847",
  :active => i % 2 == 0 ? true : false,
  :user_id => i % 2 == 0 ? regular.id : regular2.id
  )
end

# Test Inspectors
25.times do |i|
  Technician.find_or_create_by_email(
  :first_name => "Test Technician First Name " + i.to_s,
  :last_name => "Test Technician Last Name " + i.to_s,
  :email => "tech" + i.to_s + "@dampers.com", 
  :phone => "478273487293847",
  :license => 10000000+rand(10000000),
  :license_expiration => 1.year.from_now,
  :user_id => i % 2 == 0 ? regular.id : regular2.id
  )
end

# t.string :building_abbrev
      # t.date :inspection_date
      # t.integer :floor
      # t.references :technician
      # t.string :location
      # t.string :damper_id
      # t.references :damper_status
      # t.references :damper_type
      # t.string :photo_url
      # t.string :description
      # t.references :job
      # t.references :user
# Test Inspections
200.times do |i|
  Inspection.find_or_create_by_damper_id(
  :inspection_date => rand(15).day.from_now,
  :building_abbrev => "Building Abbrev " + i.to_s,
  :floor => i,
  :location => "Location " + i.to_s,
  :technician_id => 1+rand(24), 
  :damper_id => (i+rand(24)).to_s,
  :damper_status_id => 1+rand(1),
  :damper_type_id => 1+rand(14),
  :photo_url => "http://url"+i.to_s,
  :description => "Description "+i.to_s,
  :job_id => 1+rand(24),
  :user_id => 1+rand(24)  
  )
end

