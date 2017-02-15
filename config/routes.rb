Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
  resources :users
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  get '/schedule', to: 'seasons#schedule', as: 'schedule'
  get '/list_teams', to: 'seasons#list_teams', as: 'list_teams'


  # resources :games

  resources :seasons, shallow: true do
    resources :games
    resources :teams, only: [:edit]
  end
end
