class MembershipTemplatesController < SchoolBaseController
  layout "settings"

  before_action :set_membership_templates

  def index; end

  private

  def set_membership_templates
    @membership_templates = MembershipTemplate.all
  end
end
