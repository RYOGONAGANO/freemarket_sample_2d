class ProductsController < ApplicationController

  def index
    @product = Product.new
  end

  def new
  end

  def create
    @product = Product.create(product_params)
    redirect_to root_path
  end

  def edit
  end

  def update
  end

  def show
  end

  def destroy
  end
  

  private

  def  product_params
    params.require(:product).permit(:name)
  end
end
