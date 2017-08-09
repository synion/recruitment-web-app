class UsersController < ApplicationController
  before_action :authenticate_user!, only: :index

  def index
    authorize current_user

    respond_to do |format|
      format.html { render locals: { users: q.result(distinct: true).includes(:interests),
                                     q: User.ransack(params[:q]) } }
      format.csv { send_data User.to_csv, filename: "users-#{Date.today}.csv" }
    end
  end

  def destroy
    authorize user
    user.destroy
    redirect_to users_path
    flash[:danger] = "User was deleted"
  end

  private

  def q
    @q ||= User.includes(:interests).ransack(params[:q])
  end

  def user
    @user ||= User.find(params[:id])
  end
end
