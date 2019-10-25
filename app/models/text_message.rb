class TextMessage < ActiveRecord::Base
  validates :phone_number, presence: true
  validates :message, presence: true
  validates :message_id, presence: true, uniqueness: true
end
