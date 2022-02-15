Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :reviews
  get "movies" => "movies#index", as: "movies"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "movies#index"
  resources :movies do
    resources :reviews, except: [:show, :index]
  end
  # resources :users
end
