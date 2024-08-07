module Access
  extend ActiveSupport::Concern

  class_methods do
    def only_school!
      before_action do
        render_unauthorized if accessing_network?
      end
    end

    def only_network!
      before_action do
        render_unauthorized if accessing_school?
      end
    end
  end

  included do
    helper_method :accessing_network?
    helper_method :accessing_school?

    sets_current_tenant :network

    before_action :check_network_access
    before_action :set_current_school

    private

    def find_tenant_by_subdomain
      SimplyTheTenant.with_global_access do
        Current.user.network
      end
    end

    def check_network_access
      render_unauthorized if accessing_network? && !Current.user.at_least_network_admin?
    end

    def set_current_school
      return unless accessing_school?

      Current.school = Current.user.schools.find_by(subdomain:)

      render_unauthorized if Current.school.nil?
    end

    def accessing_network?
      subdomain == "admin"
    end

    def accessing_school?
      !accessing_network?
    end

    def subdomain
      @subdomain ||= tenant_subdomain
    end
  end
end
