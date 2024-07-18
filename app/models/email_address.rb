class EmailAddress < ApplicationRecord
  belongs_to :emailable, polymorphic: true
end
