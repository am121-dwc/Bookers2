Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "books" => 'books#index'
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  get "homes/about" => 'homes#about', as: 'about'
  resources :users, only:[:show, :edit, :update]
  root to: "homes#top"
end