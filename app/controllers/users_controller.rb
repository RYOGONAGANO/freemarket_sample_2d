class UsersController < ApplicationController
  def show
    render partial: "users/profile"
  end
  def index
    render partial: 'users/logout'
  end

  def new
    render "users/authentication"
  end
end
