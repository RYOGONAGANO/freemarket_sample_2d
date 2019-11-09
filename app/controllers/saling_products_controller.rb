class SalingProductsController < ApplicationController
  def index
    @products = Product.where(exhibitor_id: current_user.id)
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    # @product = Product.find(params[:id])
    # if @product.exhibitor_id == current_user.id
    #   @product.destroy
    # end
  end
  
end