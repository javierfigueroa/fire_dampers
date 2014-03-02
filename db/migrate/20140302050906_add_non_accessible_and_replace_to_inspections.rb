class AddNonAccessibleAndReplaceToInspections < ActiveRecord::Migration
  def change
    change_table(:inspections) do |t|
      t.boolean :nonaccessible, :null => false, :default => false
      t.boolean :replace, :null => false, :default => false
    end
  end
end
