class EmailAddress < ApplicationRecord
  belongs_to_tenant :network
  belongs_to :emailable, polymorphic: true
end
