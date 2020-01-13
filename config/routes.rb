Rails.application.routes.draw do
  devise_for :users

  root 'homes#index'

  resources :users, only: %i[index show] do
    member do
      get :following, :followers
    end

    resources :items, expect: :index do
      resources :comments, only: :create
      resources :stocks, only: %i[create destroy]
    end
  end

  resources :tags, only: %i[show], param: :name do
    resource :follow, only: %i[create destroy], module: :tags
  end
  resources :stocks, only: :index

  resource :tagfeed, only: :show
  resource :timeline, only: :show
  resources :relationships, only: %i[create destroy]
end
