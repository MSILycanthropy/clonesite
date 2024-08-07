class ApplicationController < ActionController::Base
  include Authentication

  requires_authentication

  allow_browser versions: :modern

  private

  def render_unauthorized
    render file: "public/404.html", status: :unauthorized, layout: false
  end
end
