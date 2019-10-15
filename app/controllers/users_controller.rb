class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
  end

  def edit
  end

  def show
  end

  def create
    @user = User.create(user_params)
  end

  private

  def user_params
  end


end
