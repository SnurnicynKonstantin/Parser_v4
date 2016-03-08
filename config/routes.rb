Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'users/registrations', omniauth_callbacks: 'users/omniauth_callbacks'}

  devise_scope :user do
    get '/users/auth/:provider/upgrade' => 'omniauth_callbacks#upgrade', as: :user_omniauth_upgrade
    get '/users/auth/:provider/setup', :to => 'omniauth_callbacks#setup'
  end

  root 'home#index'

  resources :users

  resources :courses

  get '/change_locale/:locale', to: 'sessions#change_locale', as: :change_locale

end
