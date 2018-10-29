Rails.application.routes.draw do
  devise_for :users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  root 'score_board#index', as: 'score_board'


  namespace :api, defaults: { format: :json },  path: '/api/' do
    namespace :v1, defaults: { format: :json },  path: '/v1/' do
      resources :news, only: [:index]
      resources :teams, only: [:index]

      get '/scores_history', to: 'score_logs#scores_history', as: 'scores_history'
      get '/score', to: 'score_logs#score', as: 'score'

    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
