class ManagerWorkspace < ApplicationRecord
  belongs_to :user
  belongs_to :workspace

  scope :find_workspace, -> workspace_id {where "workspace_id = ?", workspace_id}
  scope :newest, -> {order created_at: :desc}

  delegate :full_name, :id, :email, :position , to: :user, prefix: true
end
