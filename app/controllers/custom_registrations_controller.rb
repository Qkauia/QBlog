class CustomRegistrationsController < Devise::RegistrationsController
  before_action :redirect_if_not_admin, only: [:new, :create]

  protected

  def redirect_if_not_admin
    unless user_signed_in? && current_user.admin?
      redirect_to root_path, alert: "抱歉，目前不允許註冊新用戶。"
    end
  end
end