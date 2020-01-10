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

  resource :tagfeed, only: :show
  resource :timeline, only: :show
  resources :relationships, only: %i[create destroy]
end
