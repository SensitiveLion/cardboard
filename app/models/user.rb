class User < ActiveRecord::Base
  has_many :reviews
  has_many :games

  mount_uploader :profile_photo, ProfilePhotoUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
