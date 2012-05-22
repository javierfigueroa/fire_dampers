class CreateDamperAirstreams < ActiveRecord::Migration
  def change
    create_table :damper_airstreams do |t|
      t.string :abbrev
      t.string :description

      t.timestamps
    end
  end
end
