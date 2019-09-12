class Character < ApplicationRecord
  belongs_to :user
  belongs_to :race
  belongs_to :gender
  belongs_to :profession
  has_many :biographies
  mount_uploader :picture, PictureUploader
  mount_uploader :pdf, PictureUploader

end
