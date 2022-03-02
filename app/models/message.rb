class Message < ApplicationRecord
  belongs_to :user
  validates :content, presence: true, length: { in: 2..255, too_long: "255 characters is the maximum allowed" }
end
