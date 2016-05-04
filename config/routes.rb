Rails.application.routes.draw do
  root to: "users#index"

  get "/users" => "users#index", as: :users
end
