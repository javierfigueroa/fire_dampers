class ChangeDataTypeForInspectionDamperId < ActiveRecord::Migration
  def up
     rename_column :inspections, :damper_id, :old_damper_id
    add_column :inspections, :damper_id, :integer
   Inspection.reset_column_information
   Inspection.all.each {|e| e.update_attribute(:damper_id, e.old_damper_id.to_i) }
   remove_column :inspections, :old_damper_id
  end

  def down
    change_table :inspections do |t|
      t.change :damper_id, :string
    end
  end
end
