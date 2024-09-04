class ReviewsController < ApplicationController
  def index
    content = Content.find_by(id: params[:content_id])

    if content.nil?
      head :not_found
      return
    end

    reviews = content.reviews.includes(:user)

    if reviews.empty?
      head :not_found
    else
      render json: reviews.map { |review|
        {
          id: review.id,
          contentId: review.contentId,
          authorId: review.authorId,
          author: review.user.nickname,
          review: review.review,
          created_at: review.created_at,
          updated_at: review.updated_at
        }
      }
    end
  end
end
