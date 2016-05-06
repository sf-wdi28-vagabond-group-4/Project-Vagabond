Rails.application.routes.draw do
  root to: "users#index"

  resources :users
  resources :posts
  resources :cities

  get "/login", to: "sessions#new", as: "login"

  post "/sessions", to: "sessions#create"

  get "/logout", to: "sessions#destroy"
end
