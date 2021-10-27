Rails.application.routes.draw do
  resources :retailers do
    resources :fields, shallow: true #, shallow: true # частичная вложенность только для index create new
  end
  root 'retailers#index'
end
