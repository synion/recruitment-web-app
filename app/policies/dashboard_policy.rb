class DashboardPolicy
  attr_reader :user, :dashboard

  def initialize(user, dashboard = :admin)
    @user = user
    @dashboard = dashboard
  end

  def index?
    user.admin?
  end
end
