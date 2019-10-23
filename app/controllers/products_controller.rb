class ProductsController < ApplicationController
  def index
    @products = Product.where("id <= ?", 10)
  end

  def show
  end
end
