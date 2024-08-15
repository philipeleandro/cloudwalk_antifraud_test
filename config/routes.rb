# frozen_string_literal: true

require "sidekiq/web"

Rails.application.routes.draw do
  devise_for :users
  devise_for :admins

  namespace :api do
    namespace :v1 do
      resources :transaction_risks, only: [:create]
    end
  end

  mount Sidekiq::Web => "/sidekiq"
end
