Rails.application.routes.draw do
  root to: "users#index"

  resources :users
  resources :cities
  resources :posts



  get "/login", to: "sessions#new", as: "login"

  post "/sessions", to: "sessions#create"

  get "/logout", to: "sessions#destroy"

  get "/cities", to: "cities#index"

end
