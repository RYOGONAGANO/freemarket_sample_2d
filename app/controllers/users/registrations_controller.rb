# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]
  prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.

  # GET /resource/sign_up
  # def new
  #   super
  # end
  def new
    @user = User.new
    @user_detail = @user.build_user_detail
  end

  def create
    params[:user][:user_detail_attributes][:birthday] = birthday_join
    @user = User.create(user_params)
    redirect_to ''
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :password_confirmation, user_detail_attributes: [:first_name, :last_name, :first_name_kata, :last_name_kata, :birthday ])
  end

  def birthday_join
    date = params[:birthday]

    if date["birthday(1i)"].empty? && date["birthday(2i)"].empty? && date["birthday(3i)"].empty?
      return
    end

    return date["birthday(1i)"].to_s + "-" + date["birthday(2i)"].to_s + "-" + date["birthday(3i)"].to_s
  end

  def check_captcha
    unless verify_recaptcha
      self.resource = resource_class.new sign_up_params
      resource.validate # Look for any other validation errors besides Recaptcha
      set_minimum_password_length
      respond_with resource
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
