class UsersController < ApplicationController
  def index
    render "users/member-information_input"
  end

  def new
    render partial: "users/login-page"
  end

end
