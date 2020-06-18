Rails.application.routes.draw do
  resources :variants
  resources :products
  resources :todos 
  root "todos#index"
end
