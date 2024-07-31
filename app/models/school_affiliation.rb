class SchoolAffiliation < ApplicationRecord
  belongs_to_tenant :network

  belongs_to :user
  belongs_to :school
end
