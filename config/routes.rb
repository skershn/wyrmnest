Rails.application.routes.draw do
  devise_for :users
  resources :topics do
    resources :comments
  end
  root 'static_pages#index'
end
