Rails.application.routes.draw do
  devise_for :users

  root 'homes#index'

  resources :users, :expect => [:index] do
    resources :items do
      resources :comments
    end
  end
end
