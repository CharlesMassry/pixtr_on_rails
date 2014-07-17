require "monban/constraints/signed_in"

Rails.application.routes.draw do
  constraints Monban::Constraints::SignedIn.new do
    root "dashboards#show", as: :dashboard
  end

  root to: "homes#show"

  resource :session, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show] do
    member do
      post "like" => "user_likes#create", as: "like"
      delete "unlike" => "user_likes#destroy", as: "unlike"
    end
  end

  resources :groups, only: [:new, :create, :show, :index] do
    member do
      post "like" => "group_likes#create", as: "like"
      delete "unlike" => "group_likes#destroy", as: "unlike"
      post "join" => "group_memberships#create"
      delete "leave" => "group_memberships#destroy"
    end
  end

  resources :galleries do
    member do
      post "like" => "gallery_likes#create", as: "like"
      delete "unlike" => "gallery_likes#destroy", as: "unlike"
    end
    resources :images, except: [:index] do
      member do
        post "like" => "image_likes#create", as: "like"
        delete "unlike" => "image_likes#destroy", as: "unlike"
        post "hate" => "hates#create", as: "hate"
        delete "unhate" => "hates#destroy", as: "unhate"
      end
      resources :comments, only: [:new, :create]
    end
  end

  resources :tags, only: [:show]
end
