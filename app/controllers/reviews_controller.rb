class ReviewsController < ApplicationController
  def new
    @omise = Omise.find(params[:omise_id])
    @review = Review.new
  end
  def create
    @review = Review.new(
      omise_id: params[:omise_id],
      user_id: current_user.id,
      rating: review_params["rating"],
      body: review_params["body"]
      )
    @review.save
    redirect_to omise_url(@review.omise)
  end
  private
  def review_params
    params.require(:review).permit(
      :rating,
      :body
      )
  end
end
