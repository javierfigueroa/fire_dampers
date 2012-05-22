# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

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
  :first_name => "Admin First Name",
  :last_name => "Admin Last Name",
  :email => "admin@mainloop.us",
  :password => 'mainloop2012',
  :role => "admin",
  :active => true
)


# Damper Types
# APW = Access Panel Wall
# ATF = Access thru Flex
# ATR = Access thru Floor
# DID = Damper in Diffuser
# DTF = Down thru Floor
# ECD = Electric Combination Damper 
# ESD = Electric Smoke Damper
# FD = Fire Damper
# VINE = Visually Identified Not Exercised 
# FD / ETL = Fire Damper Electric Thermo Link 
# FRFD = Fire Rated Flanged Door
# PCD = Pneumatic Combination Damper
# R/D = Rolling Door
# SLR = See Repair List
# O/D = Over Door L.L. = Lower Level
# EFD = Electric Fire Damper
# DNR = Disabled - Not Required
# FNR = Failed Needs Repairs
# PSD = Pneumatic Smoke Damper

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

DamperType.find_or_create_by_abbrev(:abbrev => "EFD", :description => "Electric Fire Damper")
DamperType.find_or_create_by_abbrev(:abbrev => "DNR", :description => "Disabled - Not Required")
DamperType.find_or_create_by_abbrev(:abbrev => "FNR", :description => "Failed Needs Repairs")
DamperType.find_or_create_by_abbrev(:abbrev => "PSD", :description => "Pneumatic Smoke Damper")

# Damper Statuses
# OK pass
# FAIL fail
DamperStatus.find_or_create_by_abbrev(:abbrev => "OK", :description => "Passed")
DamperStatus.find_or_create_by_abbrev(:abbrev => "FAIL", :description => "Failed")

DamperAirstream.find_or_create_by_abbrev(:abbrev => "SA", :description => "SA")
DamperAirstream.find_or_create_by_abbrev(:abbrev => "RA", :description => "RA")
DamperAirstream.find_or_create_by_abbrev(:abbrev => "EA", :description => "EA")
DamperAirstream.find_or_create_by_abbrev(:abbrev => "OA", :description => "OA")

