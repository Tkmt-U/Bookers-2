Rails.application.routes.draw do
  root 'books#index'
  devise_for :users
  get 'home/about' => 'books#about'
  resources :books, only: [:create, :index, :show, :edit, :destroy]
  resource :book, only: [:new]
  get 'users' => 'books#new', as:'users_index'

  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
