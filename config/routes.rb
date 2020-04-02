Rails.application.routes.draw do
  devise_for :users, controllers: {
  omniauth_callbacks: 'users/omniauth_callbacks',
  registrations: 'users/registrations'
}
  root to: 'posts#index'
  resources :users, only: [:index, :show]
  resources :posts, only: [:index, :new, :create, :show, :edit, :update, :destroy] do
    resources :comments, only: :create
    collection do
      get 'search'
    end
  end
end
