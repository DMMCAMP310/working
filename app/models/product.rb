class Product < ApplicationRecord
  belongs_to :category
  has_many :reviews
  acts_as_likeable
  
  
  PER = 15
 
  scope :display_list, -> (category, page) { 
    if category != "none"
      where(category_id: category).page(page).per(PER)
    else
      page(page).per(PER)
    end
  }
  
  def reviews_new
    reviews.new
  end
end
