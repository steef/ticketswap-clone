Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :listings do
    resources :tickets do
    end
  end

  resources :tickets, only: [] do # barcodes are nested inside tickets
    resources :barcodes do
    end
  end
end
