class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  sets_current_tenant :school

  private

  def find_tenant_by_subdomain
    return School.last if Rails.env.development?

    School.active.find_by!(subdomain: tenant_subdomain)
  end
end
