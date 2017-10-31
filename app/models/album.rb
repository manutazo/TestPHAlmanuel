class Album < ApplicationRecord
  belongs_to :user
  mount_uploaders :images, ImageUploader
  validates :name, presence: true, length: {minimum: 2}
  validates :description, presence: true
  validates :images, file_size: { less_than: 4.megabytes }
end
