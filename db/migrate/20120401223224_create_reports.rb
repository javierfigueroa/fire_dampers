class CreateReports < ActiveRecord::Migration
  def self.up
    create_table :reports do |t|
      t.references :job

      t.timestamps
    end
  end

  def self.down
    drop_table :reports
  end
end
