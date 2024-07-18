class School < ApplicationRecord
  simply_the_tenant

  has_many :members

  validates_presence_of :name, :subdomain, :timezone, :status
  validates_uniqueness_of :subdomain

  enum status: [ "active", "inactive" ].index_by(&:itself)
end
