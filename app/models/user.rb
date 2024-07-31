class User < ApplicationRecord
  belongs_to_tenant :network

  has_secure_password
  has_many :sessions, dependent: :destroy, foreign_key: :user_id

  has_many :school_affiliations
  has_many :schools, through: :school_affiliations
end
