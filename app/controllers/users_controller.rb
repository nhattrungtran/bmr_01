class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show

  def show
    @companies = Company.all
    @company = Company.new
    @workspace = Workspace.new
    @workspaces = Workspace.all
  end
end
