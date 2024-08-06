class MembershipTemplatesController < SchoolBaseController
  layout "settings"

  before_action :set_membership_templates, only: :index

  def index; end

  def new
    @membership_template = Current.school.membership_templates.new(price: nil, late_fee: nil, registration_fee: nil)
  end

  private

  def set_membership_templates
    @membership_templates = MembershipTemplate.all
  end
end
