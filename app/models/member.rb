class Member < ApplicationRecord
  belongs_to_tenant :school

  validates_presence_of :first_name
  validates_presence_of :last_name, if: :first_name?
end
