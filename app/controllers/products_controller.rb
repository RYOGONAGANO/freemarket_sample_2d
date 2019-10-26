class ProductsController < ApplicationController

  def index
  end

  def new
     @category = []
      Category.where(ancestry: nil).each do |parent|
         @category << parent.name
      end
      
      @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children if params[:parent_name].present? 
      @category_grandchildren = Category.find_by(name: "#{params[:child_id]}").children if params[:child_id].present?
      delivery = Product.fees[:"#{params[:method]}"]
      if delivery == 1
      @delivery_method1 = Product.shippingmethod1s 
      elsif delivery == 2
      @delivery_method2 = Product.shippingmethod2s
      else
        render new_product_path
      end
      respond_to do |format|
        format.html
        format.json
      end
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
    params.require(:product).permit(:image, :name, :description, :category, :status, :charge, :shipping_area, :shipping_date, :price, :shipping_method, :size )
  end
end
