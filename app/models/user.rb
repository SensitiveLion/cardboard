class User < ActiveRecord::Base
  has_many :reviews
  has_many :games
  has_many :comments
  has_many :votes

  mount_uploader :profile_photo, ProfilePhotoUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
