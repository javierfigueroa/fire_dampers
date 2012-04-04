# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

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
