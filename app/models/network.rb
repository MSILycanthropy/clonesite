class Network < ApplicationRecord
  simply_the_tenant

  has_many :schools, dependent: :destroy

  validates_presence_of :name

  enum :status, [ "active", "inactive" ].index_by(&:itself)
end
