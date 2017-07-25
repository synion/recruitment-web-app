class UsersController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    render locals: {
      users:  User.all
    }
  end

  def destroy
    user
    authorize user
    user.destroy
    redirect_to users_path
    flash[:danger] = "User was deleted"
  end
  private

  def user
    @user ||= User.find(params[:id])
  end
end
