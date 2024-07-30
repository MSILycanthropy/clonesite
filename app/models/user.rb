class User < ApplicationRecord
  belongs_to_tenant :network

  has_secure_password
  has_many :sessions, dependent: :destroy
end
