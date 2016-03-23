Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users, :controllers => { registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks'}

  devise_scope :user do
    get '/users/auth/:provider/upgrade' => 'omniauth_callbacks#upgrade', as: :user_omniauth_upgrade
    get '/users/auth/:provider/setup', :to => 'omniauth_callbacks#setup'
  end

  match "/delayed_job" => DelayedJobWeb, :anchor => false, via: [:get, :post]

  root 'home#index'

  resources :users do
    member do
      post :vote_up
      post :vote_down
      post :add_video
    end
  end

  resources :courses

  get '/change_locale/:locale', to: 'sessions#change_locale', as: :change_locale

  get '/:id', to: 'users#show', as: :pretty_url

  post '/search', to: 'users#search', as: :search

end
