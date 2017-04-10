class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  before_action :load_workspace, only: :index

  def show
  end

  def index
    @users = @workspace.manager_workspaces.newest.page(params[:page]).
      per Settings.per_page
    @employee_new = User.new
  end

  private

  def load_workspace
    @workspace = Workspace.find_by id: params[:workspace_id]
    return if @workspace
    flash[:warning] = t "view.workspace.not_found_workspace"
    redirect_to root_path
  end
end
