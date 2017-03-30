class CreateRooms < ActiveRecord::Migration[5.0]
  def change
    create_table :rooms do |t|
      t.string :name
      t.string :descript
      t.integer :max_guest
      t.references :workspace, foreign_key: true

      t.timestamps
    end
  end
end
