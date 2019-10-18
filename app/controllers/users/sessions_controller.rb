# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  prepend_before_action :check_captcha, only: [:create] # Change this to be any actions you want to protect.
  # GET /resource/sign_in
  def new
    @user = User.new
  end

  # POST /resource/sign_in
  # def create

  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  private

  def check_captcha
    self.resource = resource_class.new sign_in_params
    resource.validate
    verify_recaptcha(model: resource)
    if resource.errors.any?
      @error = @user.errors.full_messages_for(:base)
      respond_with_navigational(resource) { render :new }
    end
  end
  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
