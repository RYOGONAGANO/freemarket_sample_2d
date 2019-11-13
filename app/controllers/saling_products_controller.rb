class SalingProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy]
  before_action :authenticate_user!

  def index
    @products = current_user.saling_products.with_attached_images
  end

  def show
  end

  def destroy
    @product.exhibitor_id == current_user.id
    render user_saling_product_path(current_user,params[:id]) unless @product.destroy
  end

  def set_product
    @product = Product.find(params[:id])
  end

end