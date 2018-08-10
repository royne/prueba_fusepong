Rails.application.routes.draw do
  get 'messages/index'

  devise_for :users
  root 'services#index'

  resources :services, only: [:index, :new, :create]

end
