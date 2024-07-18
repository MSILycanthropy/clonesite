class School < ApplicationRecord
  validates_presence_of :name, :subdomain, :timezone, :status

  validates_uniqueness_of :subdomain
end
