Rails.application.routes.draw do
  devise_for :users
  root to: 'boards#index'

  resources :boards do
    resources :tasks, shallow: true do #index, new, createはBoardのidを必要
      resources :comments, only: [:new, :create]
    end
  end

  resource :profile, only: [:show, :edit, :update]
end
