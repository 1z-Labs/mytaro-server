class ReviewsController < ApplicationController
  def index
    content = Content.find(params[:content_id])
    reviews = content.reviews.includes(:user).select(:review, :authorId)
    render json: reviews.map { |review| { author: review.user.nickname, review: review.review } }
  end
end
