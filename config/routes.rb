Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get "dashboard", to: "pages#dashboard", as: :dashboard
  get "shopping_cart", to: "pages#shopping_cart", as: :shopping_cart
  delete "orders/:id", to: "orders#destroy", as: :order

  resources :authors, only: %i[ edit update ]
  resources :books, only: %i[ edit update ]
  resources :authors_books, only: %i[ index ] do
    resources :orders, only: %i[ create ]
  end
end
