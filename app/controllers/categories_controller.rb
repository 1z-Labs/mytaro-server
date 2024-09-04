class CategoriesController < ApplicationController
  # HOME 화면 카테고리 정보를 가져오는 API
  def index
    @categories = Category.all
    if @categories.empty?
      render json: { error: '카테고리를 찾을 수 없습니다.' }, status: :not_found
    else
      render json: @categories, status: :ok
    end
  end
end
