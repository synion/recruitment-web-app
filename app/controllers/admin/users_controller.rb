class Admin::UsersController < Admin::BaseController

  def index
    authorize :dashboard
    render locals: { users:  User.all }
  end

  def new
    authorize :user
    render locals: { user: User.new }
  end

  def create
    authorize :user
    user = User.create_by_admin(user_params)
    if user.save
      redirect_to admin_path
    else
      render 'new'
    end
  end

  def edit
    authorize :user
    render locals: { user: User.find(params[:id]) }
  end

  def update
    authorize :user
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      redirect_to admin_path
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :age, :gender, interests_attributes:[:id, :name, :type, :_destroy])
  end

  def locals(values)
  render locals: values
  end
end

