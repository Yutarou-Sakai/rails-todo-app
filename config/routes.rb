Rails.application.routes.draw do
  devise_for :users
  root to: 'boards#index'

  resources :boards do
    resources :tasks, shallow: true #index, new, createはBoardのidを必要
  end
  resource :profile, only: [:show, :edit, :update]
end
