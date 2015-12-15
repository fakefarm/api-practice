Rails.application.routes.draw do
  resources :alerts
  resources :payments, only: [:create]
end
