class RemoveTechnicianIdFromInspections < ActiveRecord::Migration
  def up
   remove_column :inspections, :technician_id
  end

  def down
  end
end
