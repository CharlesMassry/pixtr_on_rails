Rails.application.routes.draw do
  root to: "galleries#index"
  resources :users, only: [:new]
  resources :galleries do
    resources :images, except: [:index]
  end
end
