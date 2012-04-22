class AddLicenseImageToTechnicians < ActiveRecord::Migration
  def up
    change_table :technicians do |t|
      t.has_attached_file :license_image
    end
  end

  def down
      drop_attached_file :technicians, :license_image
  end
end
