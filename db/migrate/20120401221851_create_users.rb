class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.date :registration_date
      t.date :last_login_date
      t.date :account_expiration_date
      t.string :license_number
      t.date :license_expiration_date
      t.string :phone
      t.references :user_type

      t.timestamps
    end
    
    add_index :users, :user_type_id
  end

  def self.down
    drop_table :users
  end
end
