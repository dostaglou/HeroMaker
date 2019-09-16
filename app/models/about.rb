class About < ApplicationRecord
  belongs_to :user
  validates :about, length: { maximum: 300 }
end
