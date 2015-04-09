class User < ActiveRecord::Base
  has_many :reviews
  has_many :games
  has_many :comments
  has_many :votes

  LEVEL = {
    0 => "candyland newb",
    1 => "settler's apprentice",
    2 => "journeyman of puzzles",
    3 => "card shark",
    4 => "dominionator",
    5 => "game master"
  }

  mount_uploader :profile_photo, ProfilePhotoUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def has_authority?
    authority == "admin" || authority == "mod"
  end

  def karma_score
    reviews = Review.where(user_id: id)
    games = Game.where(user_id: id)
    xp = 0
    reviews.each do |review|
      xp += 1
      xp += review.vote_count
    end
    games.each do |game|
      xp += 1
    end
    xp
  end

  def status
    user = User.find(id)
    if user.karma_score < 25
      level = 0
      LEVEL[level]
    elsif user.karma_score < 50
      level = 1
      LEVEL[level]
    elsif user.karma_score < 75
      level = 2
      LEVEL[level]
    elsif user.karma_score < 100
      level = 3
      LEVEL[level]
    elsif user.karma_score < 150
      level = 4
      LEVEL[level]
    elsif user.karma_score < 200
      level = 5
      LEVEL[level]
    end
  end
end
