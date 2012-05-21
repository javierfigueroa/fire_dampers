class AddCompanyToInspections < ActiveRecord::Migration
  change_table(:inspections) do |t|
  ## Database authenticatable
    t.references :company, :null => false, :default => 0
  end

  add_index :inspections, :company_id
end
