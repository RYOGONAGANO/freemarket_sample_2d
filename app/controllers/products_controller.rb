class ProductsController < ApplicationController
  # protect_from_forgery with: :null_session
  skip_before_action :verify_authenticity_token, only: [:image]

  def index
    @products = Product.where("id <= ?", 10)
  end

  def new
    @product = Product.new
  end
  #  FIXME:ランダムで起動してる。
  def create
    binding.pry
  end
  #  FIXME: befor_actionで呼び出してifでやるかやらないかを決める
  def image
    session[:images] = params[:product][:images]
  end

  def show
    @product = Product.find(params[:id])
    @previous = @product.previous
    @next = @product.next
    @buyer_products = Product.where("buyer_id = ? and id != ?", "#{@product.buyer.id}", "#{params[:id]}").order(created_at: "DESC").limit(6)
  end
end
