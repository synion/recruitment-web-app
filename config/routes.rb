Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:index, :destroy]
  root 'users#index'
  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
    resources :users, except: [:show,:destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
