Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  get 'users/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "users#index"
end