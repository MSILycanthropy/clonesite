class Member < ApplicationRecord
  belongs_to_tenant :school

  validates_presence_of :first_name, :pin, :status
  validates_presence_of :last_name, if: :first_name?

  enum :status, [ "active", "inactive" ].index_by(&:itself)
  enum :sex, [ "male", "female", "other" ].index_by(&:itself)

  has_one :email_address, as: :emailable
  has_one :phone_number, as: :callable

  accepts_nested_attributes_for :email_address, reject_if: ->(e) { e[:address].blank? }
  accepts_nested_attributes_for :phone_number, reject_if: ->(p) { p[:number].blank? }

  def name
    [ first_name, last_name ].compact.join(" ")
  end

  def initials
    [ first_name.first, last_name&.first ].compact.join
  end
end
