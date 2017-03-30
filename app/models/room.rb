class Room < ApplicationRecord
  belongs_to :workspace

  has_many :bookings, dependent: :destroy
end
