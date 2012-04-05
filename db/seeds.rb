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


DamperType.create!(:abbrev => "APW", :description => "Access Panel Wall")
DamperType.create!(:abbrev => "ATF", :description => "Access thru Flex")
DamperType.create!(:abbrev => "ATR", :description => "Access thru Floor")
DamperType.create!(:abbrev => "DID", :description => "Damper in Diffuser")
DamperType.create!(:abbrev => "DTF", :description => "Down thru Floor")
DamperType.create!(:abbrev => "ECD", :description => "Electric Combination Damper EFD = Electric Fire Damper")
DamperType.create!(:abbrev => "ESD", :description => "Electric Smoke Damper")
DamperType.create!(:abbrev => "FD", :description => "Fire Damper")
DamperType.create!(:abbrev => "VINE", :description => "Visually Identified Not Exercised DNR = Disabled - Not Required")
DamperType.create!(:abbrev => "FD / ETL", :description => "Fire Damper Electric Thermo Link FNR = Failed Needs Repairs")
DamperType.create!(:abbrev => "FRFD", :description => "Fire Rated Flanged Door")
DamperType.create!(:abbrev => "PCD", :description => "Pneumatic Combination Damper PSD = Pneumatic Smoke Damper")
DamperType.create!(:abbrev => "R/D", :description => "Rolling Door")
DamperType.create!(:abbrev => "SLR", :description => "See Repair List")
DamperType.create!(:abbrev => "O/D", :description => "Over Door L.L. = Lower Level")

# Damper Statuses
# OK pass
# FAIL fail
DamperStatus.create!(:abbrev => "OK", :description => "Passed")
DamperStatus.create!(:abbrev => "FAIL", :description => "Failed")

# Create Test Users
User.create!(
  :email => "admin@mainloop.us",
  :password => 'mainloop2012'
)

User.create!(
  :email => "regular@mainloop.us",
  :password => 'test123'
)

User.create!(
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
