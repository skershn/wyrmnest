Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  resources :topics do
    resources :comments
  end
  resources :users
  post 'user/:id/avatars', to: 'avatars#create', as: :avatar
  resources :dragons

  get 'search', to: 'static_pages#search'
  get 'about', to: 'static_pages#about'
end
