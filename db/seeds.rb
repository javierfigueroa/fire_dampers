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

User.create(:first_name => "Javier", :last_name => "Figueroa", :email => "javier@mainloop.us", :registration_date => Time.now, :last_login_date => nil, :account_expiration_date => 100.years.from_now, :phone => "9548156032", :user_type => UserType.find_by_privilege("admin"))
