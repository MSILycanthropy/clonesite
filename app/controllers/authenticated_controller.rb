class AuthenticatedController < ApplicationController
  include Authorization
  include Access

  around_action :with_timezone
  around_action :with_currency

  layout :determine_layout

  private

  def determine_layout
    if accessing_network?
      "network"
    else
      "school"
    end
  end

  def with_timezone
    Time.use_zone(Current.school&.timezone || "America/Chicago") { yield }
  end

  def with_currency
    currency = Money::Currency.new(Current.network.currency)

    Money.with_currency(currency) { yield }
  end
end
