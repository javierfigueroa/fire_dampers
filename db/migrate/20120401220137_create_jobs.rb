class CreateJobs < ActiveRecord::Migration
  def self.up
    create_table :jobs do |t|
      t.string :name
      t.string :address
      t.date :start_date
      t.date :finish_date
      t.string :inspected_by
      t.string :contact_first_name
      t.string :contact_last_name
      t.integer :contact_phone

      t.timestamps
    end
  end

  def self.down
    drop_table :jobs
  end
end
