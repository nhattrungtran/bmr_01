class Company < ApplicationRecord
  has_many :workspaces, dependent: :destroy
  has_many :manager_companies, dependent: :destroy
end
