class SoldoutProductsController < ApplicationController
  def index
    @products = current_user.sold_products.with_attached_images
  end
end
