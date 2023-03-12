class Dashboard::ProductsController < ApplicationController
  before_action :authenticate_admin!
  before_action :set_product, only: %w[show edit update destroy]
  layout "dashboard/dashboard"

  def index
    @sorted = ""
    @sort_list = Product.sort_list

    if params[:sort].present?
      @sorted = params[:sort]
    end

    if params[:keyword].present?
      keyword = params[:keyword].strip
      @total_count = Product.search_for_id_and_name(keyword).count
      @products = Product.search_for_id_and_name(keyword).display_list(params[:pages])
    else      
      @total_count = Product.count
      @products = Product.sort_order(@sorted).display_list(params[:page])
    end
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def create
    @product = Product.new(product_params)
    @product.save
    redirect_to dashboard_products_path
  end

  def edit
    @categories = Category.all
  end

  def update
    @product.update(product_params)
    redirect_to dashboard_products_path
  end

  def destroy
    @product.destroy
    redirect_to dashboard_products_path
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def product_params
      params.require(:product).permit(:name, :description, :price, :category_id)
    end
end
