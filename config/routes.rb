Rails.application.routes.draw do
  devise_for :users

  get "/users", to: "users#index"

  resources :tickets
  resources :vocabulary_histories
  resources :vocabularies
  resources :retailers do
    resources :fields, shallow: true do
      resources :variations, shallow: true
    end#, shallow: true # частичная вложенность только для index create new
    resources :comments
  end
  root 'retailers#index'
end
