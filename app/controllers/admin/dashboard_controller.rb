class Admin
  class DashboardController < Admin::BaseController
    def index
      authorize :dashboard
    end
  end
end
