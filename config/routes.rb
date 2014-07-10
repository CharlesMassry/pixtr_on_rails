require "monban/constraints/signed_in"

Rails.application.routes.draw do
  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end

  root to: "homes#show"

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]

  resources :groups, only: [:new, :create, :show, :index] do
    member do
      post "join" => "group_memberships#create"
      delete "leave" => "group_memberships#destroy"
    end
  end

  resources :galleries do
    resources :images, except: [:index] do
      member do
        post "like" => "likes#create", as: "like"
        delete "unlike" => "likes#destroy", as: "unlike"
        post "hate" => "hates#create", as: "hate"
        delete "unhate" => "hates#destroy", as: "unhate"
      end
      resources :comments, only: [:new, :create]
    end
  end
end
