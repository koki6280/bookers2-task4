Rails.application.routes.draw do
  devise_for :users
  
  resources :users do
  	get :followings, on: :member
    get :followers, on: :member
  end
  
  resources :relationships, only: [:create, :destroy]
  
  resources :books do
  	resources :book_comments, only: [:create, :destroy]
  	resource :favorites, only: [:create, :destroy]
  end
  
  root 'home#top'
  get 'home/about'
end