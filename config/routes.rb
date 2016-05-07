Rails.application.routes.draw do
  root to: "welcome#index"

  resources :users
  resources :cities do
    resources :posts
  end
  
  get "/welcome", to: "welcome#index"

  get "/login", to: "sessions#new", as: "login"

  post "/sessions", to: "sessions#create"

  get "/logout", to: "sessions#destroy"

  get "/cities", to: "cities#index"

end
