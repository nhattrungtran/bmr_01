class CreateWorkspaces < ActiveRecord::Migration[5.0]
  def change
    create_table :workspaces do |t|
      t.string :name
      t.string :descript
      t.references :company, foreign_key: true

      t.timestamps
    end
  end
end
