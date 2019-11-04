class SalingProductsController < ApplicationController
  def index
    @products = Product.where(exhibitor_id: current_user.id)
  end
end

# @user = current_user
# @products = @user.products

# @products = Product.where("id <= ?", 10)
# exhibitor_id