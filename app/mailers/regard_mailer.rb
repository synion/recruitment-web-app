class RegardMailer < ApplicationMailer

  def send_regard(options)
    @user_email = options[:user_email]
    @current_user_email = options[:current_user_email]
    mail to: @user_email
  end
end
