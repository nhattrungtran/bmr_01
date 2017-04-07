class WorkspacesController < ApplicationController
  before_action :load_workspace, only: [:show, :update, :destroy]

  def create
    @workspace = Workspace.new workspace_params
    if @workspace.save
      flash[:success] = t "view.workspace.add_company_success"
    else
      flash[:danger] = t "view.workspace.add_company_fail"
    end
    redirect_to :back
  end

  def update
    @workspace.update_attributes workspace_params
    respond_to do |format|
      format.json {
        render json: {
          workspace_name: @workspace.name,
          workspace_descript: @workspace.descript
        }
      }
    end
  end

  def destroy
    @workspace.destroy
    respond_to do |format|
      format.js
    end
  end

  def show
    @room = Room.new
    @rooms = Room.all
  end

  private

  def workspace_params
    params.require(:workspace).permit :name, :descript, :company_id
  end

  def load_workspace
    @workspace = Workspace.find_by id: params[:id]
    return if @workspace
    flash[:warning] = t "view.workspace.not_found_workspace"
    redirect_to root_path
  end
end
