Rails.application.routes.draw do
  resources :categories, only: [:index, :create]
  resources :ideas, only: [:index, :create]
end
