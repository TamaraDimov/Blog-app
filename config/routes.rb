Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :show] do
  resources :posts, only: [:index, :show, :new, :create]
  end

  resources :posts, only: [:index, :show, :new, :create] do
    resources :comments, only: [:new, :create]
    resources :likes, only: [:create]
  end
  devise_scope :user do
    authenticated :user do
      root 'users#index', as: :authenticated_root
    end
    unauthenticated do
      root 'users#index', as: :unauthenticated_root
    end
  end
  # Defines the root path route ("/")
  # root "articles#index"
  root 'users#index'
end