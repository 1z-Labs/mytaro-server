class CategoriesController < ApplicationController

  # HOME 화면 카테고리 정보를 가져오는 API
  def index
    @categories = Category.all
    render json: @categories
  end
end
