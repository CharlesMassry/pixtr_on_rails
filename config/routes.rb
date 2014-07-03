Rails.application.routes.draw do
  root to: "galleries#index"
  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create]
  resources :galleries do
    resources :images, except: [:index]
  end
end
