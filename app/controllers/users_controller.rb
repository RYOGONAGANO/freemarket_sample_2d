class UsersController < ApplicationController
  def show
    render partial: "users/profile"
  end
  def index
  end
end
