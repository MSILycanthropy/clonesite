class SchoolsController < AuthenticatedController
  only_network!

  before_action :set_schools

  def index; end

  private

  def set_schools
    @schools = Current.network.schools
  end
end
