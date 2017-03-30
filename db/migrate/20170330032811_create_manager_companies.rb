class CreateManagerCompanies < ActiveRecord::Migration[5.0]
  def change
    create_table :manager_companies do |t|
      t.references :user, foreign_key: true
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
