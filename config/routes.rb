Rails.application.routes.draw do
devise_for :users
  root to: 'listings#index'

  resources :listings do
    resources :tickets do
    end
  end

  resources :tickets, only: [] do # barcodes are nested inside tickets
    resources :barcodes do
    end
  end

  get '/profile', to: "users#profile", as: :profile
end
