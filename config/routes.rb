Rails.application.routes.draw do
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
end
