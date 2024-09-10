# app/models/content.rb
class Content < ApplicationRecord
  has_many :reviews, foreign_key: 'contentId'
  has_many :content_previews, foreign_key: 'contentId'
  has_many :content_chapters, foreign_key: 'contentId'
  has_many :content_categories
  has_many :categories, through: :content_categories

  # 리뷰 수를 반환하는 메서드 추가
  def review_count
    reviews.count
  end
end
