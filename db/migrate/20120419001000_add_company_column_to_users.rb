class AddCompanyColumnToUsers < ActiveRecord::Migration
  change_table(:users) do |t|
  ## Database authenticatable
    t.references :company, :null => false, :default => 0
  end

  add_index :users, :company_id
end
