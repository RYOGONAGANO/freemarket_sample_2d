class UsersController < ApplicationController
  
  def new
    render partial: "users/login-page"
  end

end
