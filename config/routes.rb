Rails.application.routes.draw do

  devise_for :users

  resources :users, only: [:index, :show, :edit, :update] do
    resources :payments, only: [:index, :show, :new, :create, :destroy]
    resources :categories, only: [:index, :show, :new, :create, :destroy]
  end

  root "users#index"
end
