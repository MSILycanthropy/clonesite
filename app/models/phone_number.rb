class PhoneNumber < ApplicationRecord
  belongs_to_tenant :school
  belongs_to :callable, polymorphic: true
end
