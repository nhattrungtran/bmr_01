class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :validatable

  has_many :bookings, dependent: :destroy
  has_many :manager_companies, dependent: :destroy
  has_many :manager_workspaces, dependent: :destroy
end
