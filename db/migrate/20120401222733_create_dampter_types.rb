class CreateDampterTypes < ActiveRecord::Migration
  def self.up
    create_table :dampter_types do |t|
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :dampter_types
  end
end
