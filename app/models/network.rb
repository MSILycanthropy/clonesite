class Network < ApplicationRecord
  simply_the_tenant

  validates_presence_of :name

  enum :status, [ "active", "inactive" ].index_by(&:itself)
end
