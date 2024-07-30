class PhoneNumber < ApplicationRecord
  belongs_to_tenant :network
  belongs_to :callable, polymorphic: true
end
