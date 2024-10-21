Rails.application.routes.draw do
  namespace :users do
    resource :profile, only: [ :edit, :update ]
  end

  resources :users, only: [ :show ], controller: "users/profiles", as: "user_profile"

  devise_for :users, controllers: { omniauth_callbacks: "users/omniauth_callbacks", registrations: "users/registrations" }
  resources :events do
    member do
      post "attend"
      delete "unattend"
      # note for future owen:
      # this is the same as doing:
      # resources :events
      # post 'events/:id/attend', to: 'events#attend'
      # delete 'events/:id/unattend', to: 'events#unattend'
      # member routes are used when you want to add a custom action that relates to a single instance of a resource.
      # These routes will include the resource's ID in the URL
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  root "events#index"
end
