Rails.application.routes.draw do

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :notifications, only: [:create]

  mount ActionCable.server => "/cable"

  resources :chat_rooms

  resources :messages, only: [:create, :index]

end
