class AddMoreFieldsToInspections < ActiveRecord::Migration
  def change
      change_table :inspections do |t|
        t.has_attached_file :damper_image_second
        t.references :damper_airstream  
        t.string :length
        t.string :height
        t.string :notes
        t.string :tag
      end
      
      add_index :inspections, :damper_airstream_id
  end
  
  def down
      drop_attached_file :inspections, :damper_image_second
  end
end
