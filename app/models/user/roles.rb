module User::Roles
  extend ActiveSupport::Concern

  included do
    enum :role, [ "super_admin", "network_admin", "school_admin", "staff" ].index_by(&:itself)

    def at_least_network_admin?
      network_admin? || super_admin?
    end

    def at_least_school_admin?
      school_admin? || at_least_network_admin?
    end

    def at_least_staff?
      true
    end
  end
end
