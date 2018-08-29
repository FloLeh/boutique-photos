Rails.application.routes.draw do
  ressources :orders, only: [:index, :create]
  get 'carts_items/create'
  devise_for :users
  root to: 'static_pages#index'
  get '/items/:id', to: 'items#show', as:"items"
  get '/cart', to: 'cart#show', as: 'cart'
end
