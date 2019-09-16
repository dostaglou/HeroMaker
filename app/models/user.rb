class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :characters, dependent: :destroy
  has_many :stories, dependent: :destroy
  has_many :table_user_joins
  has_many :tables, through: :table_user_joins
  has_one :about
  mount_uploader :picture, PictureUploader
end
