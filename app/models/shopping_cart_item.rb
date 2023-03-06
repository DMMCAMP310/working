class ShoppingCartItem < ApplicationRecord
  acts_as_shopping_cart_item
  scope :user_cart_items, -> (user_shoppingcart) { where(owner_id: user_shoppingcart) }
end
