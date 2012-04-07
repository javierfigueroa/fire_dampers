class CreateReports < ActiveRecord::Migration
  def self.up
    create_table :reports do |t|
      t.references :job
      t.references :user

      t.timestamps
    end
    
    add_index :reports, :job_id
    add_index :reports, :user_id
  end

  def self.down
    drop_table :reports
  end
end
