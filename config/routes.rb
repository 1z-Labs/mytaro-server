Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  # category
  resources :categories, only: [:index]

  # /contents/:contents_id/reviews
  resources :contents, only: []do
    resources :reviews, only:[:index]
  end

  # /contents/popular
  get '/contents/popular', to: 'contents#popular'

  # 카테고리 별 각 컨텐츠의 리뷰 순으로 나열하는 API
  get 'contents/category/:category_id/reviews', to: 'contents#index_by_reviews'

  resources :my_infos do
    member do
      # GET /my_infos/:id/p_fields
      get 'p_fields', to: 'my_infos#show_p_fields'
      # GET /my_infos/:id/non_p_fields
      get 'non_p_fields', to: 'my_infos#show_non_p_fields'
    end
  end
end
