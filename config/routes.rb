Rails.application.routes.draw do
  resources :financials
  resources :clients
  devise_for :users, controllers: {
    confirmations: 'users/confirmations',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    unlocks: 'users/unlocks'
  }

  resources :orders

  get 'up' => 'rails/health#show', as: :rails_health_check

  # Defines the root path route ("/")
  root 'orders#index'
end
