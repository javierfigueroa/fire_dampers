class AddCompanyToJobs < ActiveRecord::Migration
  def change
    change_table(:jobs) do |t|
    ## Database authenticatable
      t.references :company, :null => false, :default => 0
    end
  end
end
