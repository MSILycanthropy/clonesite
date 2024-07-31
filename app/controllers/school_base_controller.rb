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
      Current.user.schools.last
    else
      Current.user.schools.find_by!(subdomain: tenant_subdomain)
    end

    render file: "public/404.html", status: :unauthorized, layout: false if Current.school.nil?
  end
end
