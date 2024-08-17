# frozen_string_literal: true

require "sidekiq/web"

Rails.application.routes.draw do
  mount Rswag::Ui::Engine => "/api-docs"
  mount Rswag::Api::Engine => "/api-docs"

  devise_for :users

  namespace :api do
    namespace :v1 do
      resources :transaction_risks, only: %i[create index]
    end
  end

  mount Sidekiq::Web => "/sidekiq"
end
