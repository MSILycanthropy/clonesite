class ApplicationController < ActionController::Base
  include Authentication

  allow_browser versions: :modern

  sets_current_tenant :network

  private

  def find_tenant_by_subdomain
    return Network.last if Rails.env.development?

    Network.active.find_by!(subdomain: tenant_subdomain)
  end
end
