class ApplicationController < ActionController::Base
  include Authentication
  include Pundit::Authorization

  requires_authentication

  allow_browser versions: :modern

  rescue_from Pundit::NotAuthorizedError do
    render_unauthorized
  end

  private

  def render_unauthorized
    render file: "public/404.html", status: :unauthorized, layout: false
  end

  def pundit_user
    Current.user
  end
end
