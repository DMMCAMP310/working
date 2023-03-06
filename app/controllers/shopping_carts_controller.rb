class ShoppingCartsController < ApplicationController
  before_action :set_cart, only: %i[index create destroy]

  def index
    @user_cart_items = ShoppingCartItem.user_cart_items(@user_cart)
  end
  
  def show
    @cart = ShoppingCart.find(user_id: current_user)
  end

  def create
    @product = Product.find(product_params[:product_id])
    @user_cart.add(@product, product_params[:price].to_i, product_params[:quantity].to_i)
    redirect_to cart_users_path
  end
  
  def update
  
  end
  
  def destroy
    @user_cart.buy_flag = true
    @user_cart.save
    redirect_to cart_users_url
  end


  private
  
    def product_params
      params.permit(:product_id, :price, :quantity)
    end
    
    def set_cart
      @user_cart = ShoppingCart.set_user_cart(current_user)
    end
end
