class AddUnitNumberToInspections < ActiveRecord::Migration
  def change
     change_table :inspections do |t|
        t.integer :unit
      end
  end
end
