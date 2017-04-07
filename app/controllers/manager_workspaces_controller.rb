class ManagerWorkspacesController < ApplicationController
  before_action :load_user, only: [:update, :create]
  before_action :manager_workspace_params, only: :create

  def update
    if @user.update_attributes update_params
      respond_to do |format|
        format.json {render json: @user}
      end
    end
  end

  private

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:warning] = t "view.user.not_found_user"
    redirect_to :back
  end

   def update_params
    params.require(:user).permit :position
  end

  def manager_workspace_params
    params.require(:manager_workspace).permit :user_id, :workspace_id
  end
end
