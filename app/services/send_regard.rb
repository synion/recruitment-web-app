class SendRegard
  def initialize(options)
    @current_user_id = options[:current_user_id]
    @user_id = options[:user_id]
  end

  def call
    RegardMailer.send_regard(current_user_email: current_user_email,
                             user_email: user_email).deliver
  end

  private

  attr_reader :current_user_id, :user_id

  def current_user_email
    User.find(current_user_id).email
  end

  def user_email
    User.find(user_id).email
  end
end
