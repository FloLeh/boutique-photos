Rails.application.routes.draw do
  devise_for :users
  resources :orders, only: [:new,:create]
  root to: 'static_pages#index'
  get '/items/:id', to: 'items#show', as:"items"
  get '/cart', to: 'cart#show', as: 'cart'
  post '/cart', to: 'items#add_to_cart'
  post '/', to: 'cart#empty'
  get '/remove', to: 'cart#remove_item', as: 'remove_item'
  post '/remove', to: 'cart#remove_item'

  get '/users/:id', to: 'static_pages#show', as:'user_show'

end
