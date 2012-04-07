class CreateInspections < ActiveRecord::Migration
  def self.up
    create_table :inspections do |t|
      t.string :building_abbrev
      t.date :inspection_date
      t.integer :floor
      t.references :technician
      t.string :location
      t.string :damper_id
      t.references :damper_status
      t.references :damper_type
      t.string :photo_url
      t.string :description
      t.references :job
      t.references :user

      t.timestamps
    end
    
    add_index :inspections, :damper_status_id
    add_index :inspections, :damper_type_id
    add_index :inspections, :job_id
    add_index :inspections, :technician_id
    add_index :inspections, :user_id
  end

  def self.down
    drop_table :inspections
  end
end
