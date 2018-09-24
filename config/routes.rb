Rails.application.routes.draw do
  resources :vehicules
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users

  authenticated :user do
    root 'home#index', as: :authenticated_root
  end
  devise_scope :user do
    root 'devise/sessions#new', as: :root_path
    get 'users/', to: 'devise/registrations#new'
  end
  
end
