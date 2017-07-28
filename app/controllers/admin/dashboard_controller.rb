class Admin::DashboardController < Admin::BaseController

  def index
    authorize :dashboard
  end
end

