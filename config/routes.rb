Rails.application.routes.draw do
  resources :categories, only: [:index] # category
end
