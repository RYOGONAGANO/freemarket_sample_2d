class UsersController < ApplicationController
  
  def new
    render partial: "users/login-page"
  end

  def show
    render partial: "users/profile"
  end


end
