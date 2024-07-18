class PhoneNumber < ApplicationRecord
  belongs_to :callable, polymorphic: true
end
