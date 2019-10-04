class UsersController < ApplicationController
  def index
    render partial: 'users/logout'
  end

  def new
    render "users/authentication"
  end

  


end
