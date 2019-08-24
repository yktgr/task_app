Rails.application.routes.draw do
  root to: 'sessions#new'
  resources :sessions, only:[:new, :create, :destroy]
  resources :tasks
  resources :labels
  namespace :admin do
    resources :users
  end
  resources :users, only:[:new, :create,:show, :edit, :update, :destroy]
end
