Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # category
  resources :categories, only: [:index]

  # /contents/:contents_id/reviews
  resources :contents do
    resources :reviews, only:[:index]
  end
end
