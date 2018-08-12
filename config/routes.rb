Rails.application.routes.draw do
  root 'services#index'

  devise_for :users

  resources :services, only: [:index, :new, :create]
  resources :messages, only: [:index, :new, :create]
end
