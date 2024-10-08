class User < ApplicationRecord
  include Roles

  belongs_to_tenant :network

  has_secure_password
  has_many :sessions, dependent: :destroy, foreign_key: :user_id

  has_many :school_affiliations, dependent: :destroy
  has_many :schools, through: :school_affiliations
end
