Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'

  # category
  resources :categories, only: [:index]

  # /contents/popular route
  get '/contents/popular', to: 'contents#popular'

  # /contents/:contents_id/reviews
  resources :contents, only: [] do
    resources :reviews, only: [:index]
  end

  resources :my_infos do
    member do
      get 'p_fields', to: 'my_infos#show_p_fields'
      get 'non_p_fields', to: 'my_infos#show_non_p_fields'
    end
  end
end
