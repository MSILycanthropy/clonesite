class ApplicationController < ActionController::Base
  include Authentication

  requires_authentication

  allow_browser versions: :modern
end
