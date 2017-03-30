class CreateCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :companies do |t|
      t.string :name
      t.string :descript
      t.integer :owner_id

      t.timestamps
    end
  end
end
