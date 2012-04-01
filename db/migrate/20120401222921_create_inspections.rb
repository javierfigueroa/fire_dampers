class CreateInspections < ActiveRecord::Migration
  def self.up
    create_table :inspections do |t|
      t.string :building_abbrev
      t.date :inspection_date
      t.integer :floor
      t.references :user
      t.string :location
      t.string :damper_id
      t.references :damper_status
      t.references :damper_type
      t.string :photo_url
      t.string :description
      t.references :job

      t.timestamps
    end
  end

  def self.down
    drop_table :inspections
  end
end
