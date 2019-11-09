class SalingProductsController < ApplicationController
  def index
    @products = Product.with_attached_images.where(exhibitor_id: current_user.id)
  end
end