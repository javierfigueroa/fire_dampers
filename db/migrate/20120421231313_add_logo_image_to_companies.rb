class AddLogoImageToCompanies < ActiveRecord::Migration
  def change
    remove_column :companies, :logo
    change_table :companies do |t|
      t.has_attached_file :logo_image
    end
  end
  
  def down
      drop_attached_file :companies, :logo_image
  end
end
