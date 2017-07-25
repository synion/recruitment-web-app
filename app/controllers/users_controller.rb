class UsersController < ApplicationController
  expose :users, ->{ User.all }
  expose :user
  before_action :authenticate_user!, only: :index

   def destroy
    authorize user
    user.destroy
    redirect_to users_path
    flash[:danger] = "User was deleted"
  end
end
