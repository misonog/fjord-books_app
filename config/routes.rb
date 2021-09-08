Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  devise_for :users
  resources :users, only: [:index, :show]

  root 'books#index'
  resources :books
end
