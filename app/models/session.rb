class Session < ApplicationRecord
  has_secure_token

  belongs_to :user, primary_key: :id
end
