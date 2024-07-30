class Network < ApplicationRecord
  simply_the_tenant

  validates_presence_of :subdomain, :name
  validates_uniqueness_of :subdomain

  enum :status, [ "active", "inactive" ].index_by(&:itself)
end
