class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]

  def index
    @products = Product.with_attached_images.where("id <= ? and exhibitor_id != ?", "10", "current_user").where(buyer_id: nil)
  end

  def new
    @category = []
    Category.where(ancestry: nil).map { |parent| @category << [parent.name, parent.id] }
    @product = Product.new
    @category_children = Category.find_by(id: "#{params[:parent_id]}", ancestry: nil).children if params[:parent_id].present?
    @category_grandchildren = Category.find_by(name: "#{params[:child_id]}").children if params[:child_id].present?
    @category_size = Category.find_by(name: "#{params[:size]}") if params[:size].present?
    @size = @category_size[:id] if @category_size.present?
    @size_val = Product.sizes if (33 <= @size.to_i && @size.to_i <= 102) || (@size.to_i == 13) || (193 <= @size.to_i && @size.to_i <= 195)
    delivery = Product.fees[:"#{params[:method]}"]
    if delivery == 1
      @delivery_method1 = Product.shipping_method1s
    elsif delivery == 2
      @delivery_method2 = Product.shipping_method2s
    else
      render new_product_path
    end
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    binding.pry
    @product = Product.new(product_params)
    images = params[:product][:images]
    hash = images.permit!.to_h
    hash_size = hash.length

    if @product.save
      for i in 0..(hash_size - 1) do
        @product.images.attach(params[:product][:images]["#{i}"])
      end
      redirect_to root_path
    else
      render new_product_path
    end
  end

  def edit
  end

  def update
  end

  def show
    @product = Product.find(params[:id])
    @previous = @product.previous
    @next = @product.next
    @buyer_products = Product.where("exhibitor_id = ? and id != ?", "#{@product.exhibitor.id}", "#{params[:id]}").order(created_at: "DESC").limit(6)
  end

  def destroy
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :category_id, :status, :fee, :shipping_area, :shipping_date, :price, :shipping_method, :size).merge(exhibitor_id: current_user.id)
  end
end
