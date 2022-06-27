Rails.application.routes.draw do

  devise_for :users

  devise_scope :user do
    get '/sign-in' => "devise/sessions#new", :as => :login
  end

  resources :users, only: [:index]
  resources :payments, only: [:index, :show, :new, :create, :destroy]
  resources :categories, only: [:index, :show, :new, :create, :destroy]

  root "payments#index"
end
