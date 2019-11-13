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



end
