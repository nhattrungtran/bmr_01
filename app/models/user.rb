class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :validatable

  has_many :bookings, dependent: :destroy
  has_many :manager_companies, dependent: :destroy
  has_many :manager_workspaces, dependent: :destroy

  enum position: {admin: 0, company_manager: 1, workspace_manager: 2, personnel: 3}
end
