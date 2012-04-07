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
      t.boolean :active, :null => false, :default => true
      t.references :user   

      t.timestamps
    end
    
    add_index :jobs, :user_id
  end

  def self.down
    drop_table :jobs
  end
end
