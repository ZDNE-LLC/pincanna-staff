Rails.application.routes.draw do
  namespace :manager do
    resources :password_reset_completions, only: [:index] do
      post 'process_completion', to: 'password_reset_completions#process_request', on: :collection
    end
  end
  namespace :versions do
    get 'changelog/:class_name/:id', to: 'changelogs#show'
  end
  namespace :support do
    resources :tickets, only: [:index, :new, :create, :show] do
      patch :cancel, on: :member, to: 'tickets#cancel'
    end
    resources :password_resets, only: [:new, :create]
  end
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#root"
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'
end
