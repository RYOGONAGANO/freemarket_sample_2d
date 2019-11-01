class ProductsController < ApplicationController

  def index
    @products = Product.where("id <= ?", 10)
  end

  def new
    @product = Product.new
  end

  def create
    session[:images] = params[:product][:images] unless session[:images]
  end

  def show
    @product = Product.find(params[:id])
    @previous = @product.previous
    @next = @product.next
    @buyer_products = Product.where("buyer_id = ? and id != ?", "#{@product.buyer.id}", "#{params[:id]}").order(created_at: "DESC").limit(6)
  end
end
