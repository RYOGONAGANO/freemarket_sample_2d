class SalingProductsController < ApplicationController
  def index
    @products = current_user.saling_products.with_attached_images
  end
end