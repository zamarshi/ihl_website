Rails.application.routes.draw do
  get 'hello_world', to: 'hello_world#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'home#index'
  resources :users, only: [:create, :new]
  resources :sessions, only: [:new, :create] do
    delete :destroy, on: :collection
  end
  resources :games
  resources :seasons

end
