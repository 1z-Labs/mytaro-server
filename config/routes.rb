Rails.application.routes.draw do
  # category
  resources :categories, only: [:index]

  # /contents/:contents_id/reviews
  resources :contents do
    resources :reviews, only:[:index]
  end
end
