class SalingProductsController < ApplicationController
  before_action :set_product, only: [:show, :destroy]
  def index
    @products = Product.with_attached_images.where(exhibitor_id: current_user.id)
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