class DashboardController < AuthenticatedController
  only_school!

  def show; end
end
