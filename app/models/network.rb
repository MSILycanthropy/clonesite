class Network < ApplicationRecord
  simply_the_tenant

  validates_presence_of :name

  enum :status, [ "active", "inactive" ].index_by(&:itself)

  has_many :members, dependent: :destroy

  has_many :schools, dependent: :destroy
  has_many :membership_templates, dependent: :destroy

  def allows_changes?
    true
  end
end
