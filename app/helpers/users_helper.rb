module UsersHelper
  def load_workspace workspace_param
    Workspace.find_by id: workspace_param
  end
end
