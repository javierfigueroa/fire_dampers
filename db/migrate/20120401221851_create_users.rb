class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :user_type, :null => false, :default => "tech"

      t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
