Rails.application.routes.draw do
  devise_for :users
  root to: 'boards#index'

  resources :boards
  resource :profile, only: [:show, :edit, :update]
end
