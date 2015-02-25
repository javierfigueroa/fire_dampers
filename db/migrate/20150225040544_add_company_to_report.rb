class AddCompanyToReport < ActiveRecord::Migration
  def change
    change_table(:reports) do |t|
      t.references :company, :null => false, :default => 0
    end
  end
end
