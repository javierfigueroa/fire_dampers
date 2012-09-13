class ChangeDataTypeForInspectionDamperId < ActiveRecord::Migration
  def up
     change_table :inspections do |t|
      t.change :damper_id, :integer
    end
  end

  def down
    change_table :inspections do |t|
      t.change :damper_id, :string
    end
  end
end
