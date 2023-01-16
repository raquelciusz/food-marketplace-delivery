Rails.application.routes.draw do
  devise_for :users
  root to: "product#index"

  resources :products do
    resources :sales, only: %i[new create]
  end

  resources :sales, except: %i[new create]
end
