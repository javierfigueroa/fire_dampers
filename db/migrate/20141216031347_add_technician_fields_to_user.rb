class AddTechnicianFieldsToUser < ActiveRecord::Migration
  def up
    drop_table :technicians
    change_table :users do |t|
      t.has_attached_file :license_image
      t.string :license
      t.date :license_expiration
    end
  end

  def down
      drop_attached_file :users, :license_image
  end
end
