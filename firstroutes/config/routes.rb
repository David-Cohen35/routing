Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # resources :users

  # get 'users', to: 'users#index'
  # post 'users', to: 'users#create'
  # get 'users/new', to: 'users#new', as: 'new_user'
  # get 'users/:id/edit', to: 'users#edit', as: 'edit_user'
  # get 'users/:id', to: 'users#show', as:'user'
  # patch 'users/:id', to: 'users#update'
  # put 'users/:id', to: 'users#update'
  # delete 'users/:id', to: 'users#destroy'

  resources :users, only: [:index, :show, :update, :create, :destroy]
  resources :artworks, only: [:index, :show, :update, :create, :destroy]
  resources :artworkshares, only: [:create, :destroy]
  resources :comments, only: [:index, :create, :destroy]
  resources :likes, only: [:index, :create, :destroy]

  resources :users do
    resources :artworks, only: [:index]
    resources :comments, only: [:index]
    resources :likes, only: [:index]
  end


  resources :artworks do
    resources :comments, only: [:index]
    resources :likes, only: [:index]
    member do 
      get 'favorited'
    end
  end

  resources :artworkshares do
    member do 
      get 'favorited'
    end
  end

  resources :comments do
    resources :likes, only: [:index]
  end




end
