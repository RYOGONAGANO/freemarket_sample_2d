class UsersController < ApplicationController
  def index
    render partial: 'users/logout'
  end
end
