class EmployeesController < ApplicationController
  before_action :load_user, only: [:update, :destroy]

  def create
   @user = User.new user_params
    if @user.save
      @manager = ManagerWorkspace.new workspace_params
      @manager.save
      respond_to do |format|
        format.json {
          render json: @user
        }
      end
    end
  end

  def destroy
    if @user.destroy
      respond_to do |format|
        format.js
      end
    end
  end

  def update
    if @user.update_attributes user_update_params
      respond_to do |format|
        format.json {
          render json: @user
        }
      end
    end
  end

  private

  def user_params
    params.require(:user).permit :full_name, :email, :password,
      :password_confirmation, :position
  end

  def workspace_params
    params.require(:workspace).permit(:workspace_id).merge user_id: @user.id
  end

  def user_update_params
    params.require(:user).permit :full_name, :email, :password,
      :password_confirmation
  end

  def load_user
    @user = User.find_by id: params[:id]
    return if @user
    flash[:warning] = t "view.user.not_found_user"
    redirect_to :back
  end
end
