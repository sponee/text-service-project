class BadPhoneNumber < ApplicationRecord
  validates :phone_number, presence: true, uniqueness: true
end
