Rails.application.routes.draw do
  resources :validations
  resources :score_logs
  resources :exos
  resources :teams
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
