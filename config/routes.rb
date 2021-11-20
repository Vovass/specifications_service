Rails.application.routes.draw do
  resources :vocabulary_histories
  resources :vocabularies
  resources :retailers do
    resources :fields, shallow: true do
      resources :variations, shallow: true
    end#, shallow: true # частичная вложенность только для index create new
  end
  root 'retailers#index'
end
