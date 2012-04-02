class User < ActiveRecord::Base
  validations :first_name, :presence => true,
  validations :last_name, :presence => true,
  validations :email, :presence => true,
  validations :account_expiration_date, :presence => true
  
  belongs_to :user_type
end
