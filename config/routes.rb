Rails.application.routes.draw do
  devise_for :users

  root 'splash#index'

  resources :users
  resources :categories, only: [:index, :show, :new, :create, :destroy] do
    resources :expenses, only: [:new, :create, :destroy]
  end
end
