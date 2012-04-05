class CreateDampterTypes < ActiveRecord::Migration
  def self.up
    create_table :damper_types do |t|
      t.string :abbrev
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :damper_types
  end
end
