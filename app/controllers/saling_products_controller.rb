class SalingProductsController < ApplicationController
  def index
    @user = current_user
    @products = @user.products
  end
end
