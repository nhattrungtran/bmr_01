module ApplicationHelper

  def active_menu controller
    params[:controller] == controller ? "active" : ""
  end

  def resource_name
    :user
  end
  def is_workspace_controller controller
    params[:controller] == controller
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
