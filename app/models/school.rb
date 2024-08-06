class School < ApplicationRecord
  belongs_to_tenant :network

  validates_presence_of :name, :timezone, :status

  enum :status, [ "active", "inactive" ].index_by(&:itself)

  has_many :school_registrations, dependent: :destroy
  has_many :members, through: :school_registrations

  has_many :school_affiliations, dependent: :destroy
  has_many :uesrs, through: :school_affiliations, dependent: :destroy
end
