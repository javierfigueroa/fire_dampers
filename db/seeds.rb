# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

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
  :active => i % 2 == 0 ? true : false
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
  :license_expiration => 1.year.from_now 
  )
end

# Create Test Users
User.find_or_create_by_email(
  :email => "admin@mainloop.us",
  :password => 'mainloop2012'
)

User.find_or_create_by_email(
  :email => "regular@mainloop.us",
  :password => 'test123'
)

User.find_or_create_by_email(
  :email => "tech@mainloop.us",
  :password => 'test123'
)

user = User.find_by_email("admin@mainloop.us")
user.user_type = "admin"
user.save!

user = User.find_by_email("regular@mainloop.us")
user.user_type = "regular"
user.save!

user = User.find_by_email("tech@mainloop.us")
user.user_type = "tech"
user.save!
