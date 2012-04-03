# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

UserType.find_or_create_by_privilege(:privilege => "admin")
UserType.find_or_create_by_privilege(:privilege => 'regular')
UserType.find_or_create_by_privilege(:privilege => 'tech')
UserType.find_or_create_by_privilege(:privilege => 'client')

admin = UserType.find_by_privilege("admin")
User.create!(
  :email => "javier@mainloop.us",
  :password => 'mainloop2012'
)

user = User.find_by_email("javier@mainloop.us")
user.first_name = "javier"
user.last_name = "figueroa"
user.user_type = admin
user.save!
