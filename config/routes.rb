Rails.application.routes.draw do
  get 'items/index'
  devise_for :users

  root 'homes#index'

  resources :users, :expect => [:index] do
    resources :items, expect: :index do
      resources :comments, only: :create

      resources :stocks, only: %i[create destroy]
    end
  end

  resources :relationships, only: %i[create destroy]
end
