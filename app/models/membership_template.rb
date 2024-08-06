class MembershipTemplate < ApplicationRecord
  belongs_to_tenant :network

  belongs_to :school

  validates_presence_of :name
  validates_presence_of :price, unless: :billing_free?
  validates_presence_of :term_length, if: :limited_duration?
  validates_presence_of :term_interval, if: -> { limited_duration? && term_length }
  validates_presence_of :attendance_amount, :attendance_interval, unless: :attendance_unlimited?

  enum :end_behavior, [ "cancel", "renew" ].index_by(&:itself), suffix: :at_end
  enum :duration_type, [ "ongoing", "limited" ].index_by(&:itself), suffix: :duration
  enum :billing_type, [ "recurring", "once", "free" ].index_by(&:itself), prefix: :billing
  enum :attendance_type, [ "unlimited", "classes", "days" ].index_by(&:itself), prefix: :attendance
end
