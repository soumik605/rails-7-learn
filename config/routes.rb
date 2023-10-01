Rails.application.routes.draw do
  get 'render/index'
  devise_for :users
  resources :quotes
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'render#index'
end
