Rails.application.routes.draw do

  devise_for :users

  resources :payments, only: [:index, :show, :new, :create, :destroy]
  resources :categories, only: [:index, :show, :new, :create, :destroy]

  root "users#index"
end
