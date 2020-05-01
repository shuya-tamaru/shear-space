Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: 'posts#index'
  resources :users, only: [:index, :show]
  resources :privasies, only: [:index]
  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: :create
    collection do
      get 'search'
      get 'search_category'
    end
    # member do
    # end
  end
end
