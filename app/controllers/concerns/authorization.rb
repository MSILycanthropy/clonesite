module Authorization
  extend ActiveSupport::Concern

  include Pundit::Authorization

  included do
    rescue_from Pundit::NotAuthorizedError, with: :render_unauthorized

    def pundit_user
      Current.user
    end
  end
end
