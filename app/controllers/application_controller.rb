class ApplicationController < ActionController::Base
  include Authentication

  requires_authentication

  allow_browser versions: :modern

  private

  def with_timezone
    Time.use_zone(Current.school.timezone) { yield }
  end

  def with_currency
    Money.with_currency(Current.school.currency) { yield }
  end
end
