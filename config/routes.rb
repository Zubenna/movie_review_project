Rails.application.routes.draw do
  devise_for :users
  resources :reviews
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "movies#index"
  resources :movies do
    resources :reviews, except: [:show, :index]
  end
  # resources :users
end
