Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  root 'home#index'

  resources :users

  resources :courses

  get '/change_locale/:locale', to: 'sessions#change_locale', as: :change_locale
end
