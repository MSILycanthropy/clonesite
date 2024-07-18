class Member < ApplicationRecord
  belongs_to_tenant :school

  validates_presence_of :first_name
  validates_presence_of :last_name, if: :first_name?

  # enum status: [ "active", "inactive" ].index_by(&:itself)

  has_one :email_address
  has_one :phone_number

  def name
    [ first_name, last_name ].join(" ")
  end
end
