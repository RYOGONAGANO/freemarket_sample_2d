class SalingProductsController < ApplicationController
  def index
    @products = Product.where(exhibitor_id: current_user.id)
  end
end