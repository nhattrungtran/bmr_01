class CreateBookings < ActiveRecord::Migration[5.0]
  def change
    create_table :bookings do |t|
      t.references :user, foreign_key: true
      t.string :title_meeting
      t.references :room, foreign_key: true
      t.datetime :time_start
      t.datetime :time_end
      t.integer :number_guest
      t.integer :book_status
      t.integer :meeting_status

      t.timestamps
    end
  end
end
