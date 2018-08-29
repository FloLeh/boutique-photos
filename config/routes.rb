Rails.application.routes.draw do

  devise_for :users
  root to: 'static_pages#index'
  get '/items/:id', to: 'items#show', as:"items"
  get '/cart', to: 'cart#show', as: 'cart'
  post '/cart', to: 'items#add_to_cart'
end
