Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :jets do
    resources :reviews
    resources :bookings, only: [:new, :create, :destroy]
  end
  resources :bookings, only: [:show, :destroy, :index]

  get '/my_jets', to: 'jets#my_jets'
  get '/dashboard', to: 'dashboard#dashboard'
end
