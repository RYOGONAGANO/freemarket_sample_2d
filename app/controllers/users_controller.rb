class UsersController < ApplicationController
  
  def new
    render partial: 'users/sms-phonenum-confrm'
  end



end
