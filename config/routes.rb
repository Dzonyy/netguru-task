Rails.application.routes.draw do
  devise_for :users

  root "home#welcome"

  resources :genres, only: :index do
    member do
      get "movies"
    end
  end

  resources :movies, only: [:index, :show] do
    resources :comments, only: [:create, :destroy]
    member do
      get :send_info
    end
    collection do
      get :export
    end
  end
  get "/users/most_active", to: "users#most_active"

  namespace :api, defaults: { format: "json" } do
    namespace :v1 do
      resources :movies, only: [:index, :show]
    end
    namespace :v2 do
      resources :movies, only: [:index, :show]
    end
  end
end
