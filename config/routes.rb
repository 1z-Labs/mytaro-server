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

  resources :my_infos do
    member do
      # GET /my_infos/:id/p_fields
      get 'p_fields', to: 'my_infos#show_p_fields'
      # GET /my_infos/:id/non_p_fields
      get 'non_p_fields', to: 'my_infos#show_non_p_fields'
      get 'saju'
    end
  end
end
