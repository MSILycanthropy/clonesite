class ApplicationController < ActionController::Base
  include Authentication

  requires_authentication

  allow_browser versions: :modern

  private

  def with_timezone
    Time.use_zone(Current.school.timezone) { yield }
  end

  def with_currency
    currency = Money::Currency.new(Current.school.currency)

    Money.with_currency(currency) { yield }
  end
end
