class ReviewsController < ApplicationController
  def create
    product = Product.find(params[:product_id])
    review = product.reviews_new
    review.save_review(review, review_params)
    redirect_to product_url(product)
  end

  private
    def review_params
      params.require(:review).permit(:content, :score).
             merge(user_id: current_user.id, product_id: params[:product_id])
    end
end
