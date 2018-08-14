Rails.application.routes.draw do
  root 'services#index'

  devise_for :users

  resources :services, only: [:index, :new, :create, :show]
  resources :messages, only: [:index, :new, :create, :show]
  resources :asignations, only: [:index, :new, :create]
end
