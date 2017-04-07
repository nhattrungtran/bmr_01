Rails.application.routes.draw do
  root "static_pages#index"

  devise_for :admins
  devise_for :users, controllers: {registrations: "registrations"}

  resources :users, only: [:show, :index]
  resources :companies
  resources :workspaces
  resources :rooms
  resources :employees
  resources :manager_workspaces
end
