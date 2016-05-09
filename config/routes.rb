Rails.application.routes.draw do
  root to: "welcome#index"

  resources :users
  resources :cities, only: [:index, :show] do
    resources :posts
  end

  get "/welcome", to: "welcome#index"

  get "/login", to: "sessions#new", as: "login"

  post "/sessions", to: "sessions#create"

  get "/logout", to: "sessions#destroy"

end
