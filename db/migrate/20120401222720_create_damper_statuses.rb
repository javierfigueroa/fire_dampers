class CreateDamperStatuses < ActiveRecord::Migration
  def self.up
    create_table :damper_statuses do |t|
      t.string :state

      t.timestamps
    end
  end

  def self.down
    drop_table :damper_statuses
  end
end
