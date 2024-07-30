class Current < ActiveSupport::CurrentAttributes
  attribute :session, :school, :network
  delegate :user, to: :session, allow_nil: true
end
