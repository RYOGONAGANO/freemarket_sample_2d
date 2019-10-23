class SignupsController < ApplicationController
  before_action :validates_member_information_input, only: :authentication
  before_action :validates_authentication, only: :address
  before_action :validates_address, only: :carddata

  def member_information_input
    @user = User.new
    @user.build_user_detail
  end

  def authentication
    @user = User.new
    @user.build_user_detail
  end

  def address
    @user = User.new
    @first_name = session[:user_detail_attributes]["first_name"]
    @last_name = session[:user_detail_attributes]["last_name"]
    @first_name_kata = session[:user_detail_attributes]["first_name_kata"]
    @last_name_kata = session[:user_detail_attributes]["last_name_kata"]
    @user.build_address
    @user.build_user_detail
  end

  def carddata
    @user = User.new
    @user.build_address
    @user.build_user_detail
    @card = Card.new
  end

  def create
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation]
    )
    @user.build_user_detail(session[:user_detail_attributes])
    @user.build_address(session[:address_attributes])

    Payjp.api_key = 'sk_test_717aca1da4b849138cd2e0ee'
    if params['payjp-token'].blank?
      render action: "carddata" and return
    else
      # トークンが正常に発行されていたら、顧客情報をPAY.JPに登録します。
      customer = Payjp::Customer.create(
        description: 'sample', # 無くてもOK。PAY.JPの顧客情報に表示する概要です。
        email: session[:email],
        card: params['payjp-token'], # 直前のnewアクションで発行され、送られてくるトークンをここで顧客に紐付けて永久保存します。
        metadata: {user_id: @user.id} # 無くてもOK。
      )
      if @user.save
        session[:id] = @user.id
        redirect_to regist_complete_signups_path
      else
        render '/signups/member_information_input'
      end

      @card = Card.new(user_id: @user.id, customer_id: customer.id, card_id: customer.default_card)
      redirect_to action: "carddata" and return unless @card.save
    end
  end

  def regist_complete
    sign_in User.find(session[:id]) unless user_signed_in?
  end

  private

  def user_params
    params.require(:user).permit(
      :nickname,
      :email,
      :password,
      :password_confirmation,
      user_detail_attributes: [
        :id,
        :first_name,
        :last_name,
        :first_name_kata,
        :last_name_kata,
        :birthday,
        :sms_phone,
        :phone,
        :profile
      ],
      address_attributes: [
        :id,
        :postal_code,
        :prefectures_id,
        :city,
        :address,
        :building
      ]
    )
  end

  def validates_member_information_input
    params[:user][:user_detail_attributes][:birthday] = birthday_join
    session[:nickname] = user_params[:nickname]
    session[:email] = user_params[:email]
    session[:password] = user_params[:password]
    session[:password_confirmation] = user_params[:password_confirmation]
    session[:user_detail_attributes] = user_params[:user_detail_attributes]
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation]
    )
    @user.build_user_detail(session[:user_detail_attributes])
    @user.valid?
    verify_recaptcha(model: @user)
    if @user.errors.any?
      @error = @user.errors.full_messages_for(:base)
        render member_information_input_signups_path
    end
  end

  def validates_authentication
    session[:user_detail_attributes][:sms_phone] = user_params[:user_detail_attributes][:sms_phone]
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation]
    )
    @user.build_user_detail(session[:user_detail_attributes])
    render authentication_signups_path unless @user.valid?
  end

  def validates_address
    session[:address_attributes] = user_params[:address_attributes]
    @user = User.new(
      nickname: session[:nickname],
      email: session[:email],
      password: session[:password],
      password_confirmation: session[:password_confirmation]
    )
    @user.build_user_detail(session[:user_detail_attributes])
    @user.build_address(session[:address_attributes])
    render address_signups_path unless @user.valid?
  end

  def birthday_join
    date = params[:birthday]
    if date['birthday(1i)'].empty? && date['birthday(2i)'].empty? && date['birthday(3i)'].empty?
      return
    end
    return date['birthday(1i)'].to_s + '-' + date['birthday(2i)'].to_s + '-' + date['birthday(3i)'].to_s
  end
end