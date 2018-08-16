Rails.application.routes.draw do
  root 'services#index'

  devise_for :users

  resources :services, only: [:index, :new, :create, :show, :edit, :update]
  resources :messages, only: [:index, :new, :create, :show]
  resources :asignations, only: [:index, :new, :create]
end
