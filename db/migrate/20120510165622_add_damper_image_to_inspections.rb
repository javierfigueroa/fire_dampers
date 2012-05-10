class AddDamperImageToInspections < ActiveRecord::Migration
  def change
    remove_column :inspections, :photo_url
    change_table :inspections do |t|
      t.has_attached_file :damper_image
    end
  end
  
  def down
      drop_attached_file :inspections, :damper_image
  end
end
