Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  # 전체 콘텐츠를 리뷰 수에 따라 정렬하는 라우트
  get 'contents/reviews', to: 'contents#index_all_by_reviews'

  # 사주컨텐츠의 프리뷰이미지 / 목차를 가져오는 라우트
  get 'contents/:content_id/preview', to: 'contents#preview'
  get 'contents/:content_id/chapter', to: 'contents#chapter'

  # 카테고리를 가져오는 라우트
  resources :categories, only: [:index]

  # 카테고리별로 모든 콘텐츠를 가져오는 라우트
  get 'contents/category/:category_id', to: 'contents#index_by_category'

  # 해당컨텐츠의 리뷰를 가져오는 라우트
  resources :contents, only: [:show] do
    resources :reviews, only:[:index]
  end

  # 리뷰가 N개 이상인 인기컨텐츠를 가져오는
  get '/contents/popular', to: 'contents#popular'

  # 카테고리 별 각 컨텐츠의 리뷰를 기준으로 인기순 나열하여 정보를 가져오는 라우트
  get 'contents/category/:category_id/reviews', to: 'contents#index_by_reviews'

  resources :my_infos do
    member do
      # GET /my_infos/:id/p_fields
      get 'p_fields', to: 'my_infos#show_p_fields'
      # GET /my_infos/:id/non_p_fields
      get 'non_p_fields', to: 'my_infos#show_non_p_fields'
      # GET /my_infos/:id/p_saju
      get 'p_saju', to: 'my_infos#show_p_saju'
      # GET /my_infos/:id/user_saju
      get 'user_saju', to: 'my_infos#show_user_saju'
    end
  end
end