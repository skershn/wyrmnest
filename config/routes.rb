Rails.application.routes.draw do
  devise_for :users
  resources :topics do
    #
  end
  root 'static_pages#index'
end
