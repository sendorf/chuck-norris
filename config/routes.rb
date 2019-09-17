# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'searches#new'

  resources :jokes, only: %i[show] do
    collection do
      get 'category'
      get 'random'
      post 'query'
    end
  end

  resources :searches, only: %i[new create show]
end
