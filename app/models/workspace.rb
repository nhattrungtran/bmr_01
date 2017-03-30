class Workspace < ApplicationRecord
  belongs_to :company

  has_many :manager_workspaces, dependent: :destroy
  has_many :rooms, dependent: :destroy
end
