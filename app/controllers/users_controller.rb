class UsersController < ApplicationController
  def index
    render partial: 'users/logout'
  end

  def new
    render partial: "users/login-page"
  end
end
