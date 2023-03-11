class Review < ApplicationRecord
  belongs_to :product
  belongs_to :user
  
  scope :reviews_with_id, -> { where.not(product_id: nil) }
  scope :star_repeat_select, -> {
     {
       "★★★★★" => 5,
       "★★★★" => 4,
       "★★★" => 3,
       "★★" => 2,
       "★" => 1
     }
   }
  
  def save_review(review, review_params)
    review.score = review_params[:score]
    review.content = review_params[:content]
    review.user_id = review_params[:user_id]
    review.product_id = review_params[:product_id]
    save
  end
end
