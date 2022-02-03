Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get "dashboard", to: "pages#dashboard", as: :dashboard
  resources :authors, only: %i[ edit update ]
  resources :books, only: %i[ edit update ]
end
