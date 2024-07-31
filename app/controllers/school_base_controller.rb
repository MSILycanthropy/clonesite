class SchoolBaseController < ApplicationController
  layout "school"

  sets_current_tenant :network

  before_action :set_current_school

  private

  def find_tenant_by_subdomain
    SimplyTheTenant.with_global_access do
      Current.user.network
    end
  end

  def set_current_school
    Current.school = if Rails.env.development?
      School.last
    else
      School.find_by!(subdomain: tenant_subdomain)
    end
  end
end
