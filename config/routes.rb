Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
  resources :users
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end

  get '/schedule', to: 'seasons#schedule', as: 'schedule'


  # resources :games

  resources :seasons, shallow: true do
    resources :games
  end
end
