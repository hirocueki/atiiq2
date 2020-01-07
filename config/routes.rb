Rails.application.routes.draw do
  get 'items/index'
  devise_for :users

  root 'homes#index'

  resources :users, :expect => [:index] do
    resources :items do
      resources :comments
    end
  end
end
