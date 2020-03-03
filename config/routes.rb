Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :users, only: [:inde, :show]
  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy]
end
