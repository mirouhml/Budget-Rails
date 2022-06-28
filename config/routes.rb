Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    get '/sign-in' => "devise/sessions#new", :as => :login
  end

  resources :users, only: [:index]
  resources :payments, only: [:index, :show, :create, :destroy]
  get '/categories/new' => 'categories#news', as: :new_category
  resources :categories, only: [:index, :show, :create, :destroy]

  root "categories#index"
end
