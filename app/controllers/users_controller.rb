class UsersController < ApplicationController
  def index
    render "users/member-information_input"
  end

  def new
    @user = User.new
    @user.user_detail.build
  end

  def show
  end

  def create
    @user = User.create(user_params)
  end

  private

  def user_params
    params.require(:user).permit(
                                  :nickname,
                                  :email,
                                  user_detail_attributes: [
                                    :id,
                                    :first_name,
                                    :last_name,
                                    :first_name_kana,
                                    :last_name_kata,
                                    :birth_year,
                                    :birth_month,
                                    :birth_day
                                  ]
                                )
  end
end
