Rails.application.routes.draw do
  devise_for :users

  resources :users, only: [:index, :show, :edit, :update]
  # get "/field_histories", to: "field_histories#index"

  resources :tickets
  resources :vocabulary_histories

  resources :vocabularies
  resources :retailers do
    resources :field_histories
    resources :fields, shallow: true do
      resources :variations, shallow: true
    end#, shallow: true # частичная вложенность только для index create new
    resources :comments
  end
  root 'retailers#index'
end
