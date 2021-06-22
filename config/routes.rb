Rails.application.routes.draw do
  devise_for :users
  root 'users#my_portfolio'
  get 'my_portfolio', to: 'users#my_portfolio'
  get 'my_friends', to: 'users#my_friends'
  get 'search_friends', to: 'users#search_friends'
  get 'search_stock', to: 'stocks#search'
  resources :user_stocks, only: %i[create destroy]
  resources :friendships, only: %i[create destroy]
end
