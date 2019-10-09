class UsersController < ApplicationController
  def index
  end

  def new
    @user = User.new
    @user.user_detail.build
  end

  def edit
  end

  def show
  end

  def create
    params[:user][:birthday] = birthday_join
    binding.pry
    @user = User.create(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, user_detail_attributes: [:first_name, :last_name, :first_name_kata, :last_name_kata, :birthday ])
  end

  def birthday_join
    date = params[:user][:birthday]

    if date["birthday(1i)"].empty? && date["birthday(2i)"].empty? && date["birthday(3i)"].empty?
      return
    end

    Date.new date["birthday(1i)"].to_i,date["birthday(2i)"].to_i,date["birthday(3i)"].to_i

  end
end
