Rails.application.routes.draw do

  root 'books#top'
  # root 'books#index'
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  get 'home/about' => 'books#about'
  resources :books
  get 'users' => 'users#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
