class About < ApplicationRecord
  belongs_to :user
  validates :about, length: { maximum: 500 }
end
