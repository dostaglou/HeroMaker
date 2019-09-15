class Story < ApplicationRecord
  belongs_to :user
  mount_uploader :picture, PictureUploader
  validates :synopsis, length: { maximum: 500 }
  validates :title, length: { maximum: 25 }
end
