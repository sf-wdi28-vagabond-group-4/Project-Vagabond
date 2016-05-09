Rails.application.routes.draw do
  root to: "welcome#index"

  resources :users
  resources :cities, only: [:index, :show] do
    resources :posts do
      resources :comments, except: [:index, :show]
    end
  end

  get "/welcome", to: "welcome#index"

  get "/login", to: "sessions#new", as: "login"

  post "/sessions", to: "sessions#create"

  get "/logout", to: "sessions#destroy"

  get "/users/:id/password_reset", to: "users#password", as: "password"

  patch "/users/:id/password_reset", to: "users#password_update"

end
