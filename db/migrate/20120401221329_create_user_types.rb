class CreateUserTypes < ActiveRecord::Migration
  def self.up
    create_table :user_types do |t|
      t.string :privilege, :null => false, :unique => true

      t.timestamps
    end
  end

  def self.down
    drop_table :user_types
  end
end
