class RegistrationsController < Devise::RegistrationsController

  def update
    if resource.update_attributes account_update_params
      respond_to do |format|
        format.json {
          render json: {full_name: resource.full_name}
        }
      end
    end
  end

  private

  def sign_up_params
    params.require(:user).permit :full_name, :email, :password,
      :password_confirmation
  end

  def account_update_params
    params.require(:user).permit :full_name, :email, :password,
      :password_confirmation, :current_password
  end

end
