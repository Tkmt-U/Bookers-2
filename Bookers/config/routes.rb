Rails.application.routes.draw do
  root 'books#index'
  devise_for :users
  get 'home/about' => 'books#about'
  resources :books
  get 'users' => 'books#users_index'

  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
