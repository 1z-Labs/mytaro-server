class ContentsController < ApplicationController
  def popular
    # 리뷰 수의 조건을 200으로 바꿀 것
    contents = Content.joins(:reviews)
                              .group('contents.id')
                              .having('COUNT(reviews.id) >= ?', 5)
                              .select('contents.*, COUNT(reviews.id) as reviews_count')

    render json: contents
  end

  # 카테고리별로 콘텐츠를 리뷰 수에 따라 정렬하는 API
  def index_by_reviews
    category_id = params[:category_id]  # 전달받은 카테고리 ID

    # 1. 해당 카테고리에 속하는 콘텐츠 가져오기
    contents = Content.joins(:content_categories)
                      .where(content_categories: { category_id: category_id })

    # 2. 리뷰 수 기준으로 콘텐츠 정렬 (reviews 테이블의 contentId를 사용)
    contents_with_reviews = contents
                              .left_joins(:reviews)     # 콘텐츠와 리뷰를 LEFT JOIN
                              .group('contents.id')     # 각 콘텐츠별로 그룹화
                              .order('COUNT(reviews.contentId) DESC')  # 리뷰 수 기준 내림차순 정렬

    # 3. 정렬된 콘텐츠를 반환 (리뷰 수와 함께)
    render json: contents_with_reviews, methods: [:review_count]
  end
end
