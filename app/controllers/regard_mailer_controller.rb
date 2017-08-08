class RegardMailerController < ApplicationController
  def create
    user_id = params[:user_id]
    SendRegard.new(current_user_id: current_user, user_id: user_id).call
    flash[:notice] = "You send regards"
  end
end
