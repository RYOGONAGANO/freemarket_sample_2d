class UsersController < ApplicationController
  def index
    render partial: 'users/logout'

  def new
    render "users/authentication"
  end
end
