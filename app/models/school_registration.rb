class SchoolRegistration < ApplicationRecord
  belongs_to_tenant :network

  belongs_to :member
  belongs_to :school
end
