class Character < ApplicationRecord
  belongs_to :user
  belongs_to :race
  belongs_to :gender
  belongs_to :profession
  mount_uploader :picture, PictureUploader

end
