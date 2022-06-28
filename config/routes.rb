Rails.application.routes.draw do

  # devise_for :users

  # devise_scope :user do
  #   get '/sign-in' => "devise/sessions#new", :as => :login
  # end

  resources :users, only: [:index]
  resources :categories, only: [:index, :show, :new, :create]
  resources :payments, only: [:new, :create]

  root "categories#index"
end
