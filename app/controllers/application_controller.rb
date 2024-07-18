class ApplicationController < ActionController::Base
  allow_browser versions: :modern

  sets_current_tenant :school
end
