class CreateManagerWorkspaces < ActiveRecord::Migration[5.0]
  def change
    create_table :manager_workspaces do |t|
      t.references :user, foreign_key: true
      t.references :workspace, foreign_key: true

      t.timestamps
    end
  end
end
