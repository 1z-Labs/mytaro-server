class ContentsController < ApplicationController
  def popular
    # 리뷰 수의 조건을 200으로 바꿀 것
    contents = Content.joins(:reviews)
                              .group('contents.id')
                              .having('COUNT(reviews.id) >= ?', 6)
                              .select('contents.*, COUNT(reviews.id) as reviews_count')

    render json: contents
  end
end
