Rails.application.routes.draw do

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  get '/member_details' => 'members#index'


  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :notifications, only: [:create]

  mount ActionCable.server => "/cable"

  resources :chat_rooms do
    member do
      post 'update_active'
    end
    collection do
      get 'access_links'
    end
  end

  resources :messages, only: [:create, :index]


  resources :access_links do
    collection do
      get 'verify_is_activate'
    end
  end


end
