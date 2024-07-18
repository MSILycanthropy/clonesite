class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  sets_current_tenant :school

  private

  def find_tenant_by_subdomain
    School.active.find_by!(subdomain: tenant_subdomain)
  end
end
