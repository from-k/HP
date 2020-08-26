class Event < ApplicationRecord
  validates :tag, :holded_at, presence: true
  validates :title, presence: true, length: {maximum: 50}
  validates :content, presence: true, length: {maximum: 1000}
  mount_uploader :event_image, EventImageUploader
end
