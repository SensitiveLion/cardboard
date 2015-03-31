class User < ActiveRecord::Base
  has_many :reviews
  has_many :games

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
