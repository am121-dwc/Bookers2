Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get "books" => 'books#index'
  resources :books, only: [:new, :create, :index, :show, :destroy, :edit, :update]
  resources :users, only:[:show, :edit, :update, :index]
   get '/home/about' => 'home#about', as: 'about'
  root to: "homes#top"
end