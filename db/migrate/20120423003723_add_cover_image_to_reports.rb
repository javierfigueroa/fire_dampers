class AddCoverImageToReports < ActiveRecord::Migration
   def up
    change_table :reports do |t|
      t.has_attached_file :cover_image
    end
  end

  def down
      drop_attached_file :reports, :cover_image
  end
end
