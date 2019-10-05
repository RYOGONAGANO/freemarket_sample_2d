class UsersController < ApplicationController
  
  def new
    render partial: 'users/sms-phonenum-confrm'
  
  end

  def show
    render partial: "users/profile"
  end


end
