class EmailAddress < ApplicationRecord
  belongs_to_tenant :school
  belongs_to :emailable, polymorphic: true
end
