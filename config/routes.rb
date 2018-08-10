Rails.application.routes.draw do
  devise_for :users
  root 'services#index'

  resources :services, only: [:index, :new, :create]

end
