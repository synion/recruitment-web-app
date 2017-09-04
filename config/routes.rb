Rails.application.routes.draw do
  devise_for :users
  resources :users, only: %i[index destroy]
  root 'users#index'
  namespace :admin do
    get '', to: 'dashboard#index', as: '/'
    resources :users, except: %i[show destroy]
  end

  resources :regard_mailer, only: [:create], as: :send_regard
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
