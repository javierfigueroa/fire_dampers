class AddPdfToReports < ActiveRecord::Migration
  def up
    change_table :reports do |t|
      t.has_attached_file :pdf_report
    end
  end

  def down
      drop_attached_file :reports, :pdf_report
  end
end
