class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :logo
      t.text :address
      t.string :city
      t.string :state
      t.string :zipcode
      t.string :phone
      t.string :fax

      t.timestamps
    end
  end
end
