class UsersController < ApplicationController

  before_action :authenticate_user!, only: [:index, :profile, :profilechange]

  def index
    @user = User.find_by(id: current_user)
    @products = @user.saling_products
  end

  def new
    @user = User.new
  end

  def edit
  end

  def show
  end

  def destroy
    products = current_user.buyed_products
    products.each do |product|
      product.destroy
    end
    if current_user.destroy
      redirect_to root_path
    else
      render profilechange_users_path
    end
  end



end
