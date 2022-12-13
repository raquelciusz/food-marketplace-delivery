Rails.application.routes.draw do
  get 'sale/index'
  get 'sale/new'
  get 'sale/create'
  get 'sale/destroy'
  get 'sale/update'
  get 'sale/show'
  get 'product/index'
  get 'product/new'
  get 'product/create'
  get 'product/destroy'
  get 'product/update'
  get 'product/show'
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
