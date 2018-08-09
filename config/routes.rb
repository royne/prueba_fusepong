Rails.application.routes.draw do

  resources :services, only: [:index, :new, :create]
  
end
