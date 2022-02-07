Rails.application.routes.draw do
  resources :reviews
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "movies#index"
  resources :movies
  resources :users
end
