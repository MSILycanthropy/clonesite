class AuthenticatedController < ApplicationController
  sets_current_tenant :network

  before_action :set_current_school

  around_action :with_timezone
  around_action :with_currency

  layout :determine_layout

  def self.only_school!
    before_action do
      render_unauthorized if accessing_network?
    end
  end

  def self.only_network!
    before_action do
      render_unauthorized if accessing_school?
    end
  end

  private

  def determine_layout
    if accessing_network?
      "network"
    else
      "school"
    end
  end

  def accessing_network?
    subdomain == "admin"
  end
  helper_method :accessing_network?

  def accessing_school?
    !accessing_network?
  end
  helper_method :accessing_school?

  def subdomain
    @subdomain ||= tenant_subdomain
  end

  def find_tenant_by_subdomain
    SimplyTheTenant.with_global_access do
      Current.user.network
    end
  end

  def set_current_school
    return unless accessing_school?

    Current.school = Current.user.schools.find_by(subdomain:)

    render_unauthorized if Current.school.nil?
  end

  def with_timezone
    Time.use_zone(Current.school&.timezone || "America/Chicago") { yield }
  end

  def with_currency
    currency = Money::Currency.new(Current.network.currency)

    Money.with_currency(currency) { yield }
  end
end
