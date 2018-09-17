Rails.application.routes.draw do
  root "movies#index"
  resources :movies do
    resources :reviews
  end

  resources :users, only: [:new, :create]
  resources :sessions, only: [:new, :create, :destroy]
  get '/login', to: 'sessions#new'
end
