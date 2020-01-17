Rails.application.routes.draw do
  devise_for :users
  root 'static_pages#index'
  resources :topics do
    resources :comments
  end
  resources :users, only: :show
  post 'user/:id/avatars', to: 'avatars#create', as: :avatar
  resources :dragons
end
