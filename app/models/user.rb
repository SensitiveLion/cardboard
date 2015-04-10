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

  devise(:database_authenticatable, :registerable, :recoverable,
    :rememberable, :trackable, :validatable, :omniauthable)

  def has_authority?
    authority == "admin" || authority == "mod"
  end

  TEMP_EMAIL_REGEX = /\Achange@me/
  TEMP_EMAIL_PREFIX = 'change@me'
  #validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update

  def self.find_for_oauth(auth, signed_in_resource = nil)

    # Get the identity and user if they exist
    identity = Identity.find_for_oauth(auth)

    user = signed_in_resource ? signed_in_resource : identity.user
    # Create the user if needed
    if user.nil?
      # check for email exists and verified
      email_is_verified = auth[:info][:email] &&
        # facebook-email               google email
        (auth[:info][:verified] || auth[:extra][:raw_info][:email_verified])

      email = auth[:info][:email] if email_is_verified
      user = User.where(email: email).first if email

      if auth[:provider] == "facebook"
        location = (auth[:extra][:raw_info][:locale][-2..-1])
        username = auth[:info][:first_name].concat(auth[:info][:last_name]).concat(auth[:extra][:raw_info][:id].to_s[-3..-1])
        profile_photo = auth[:info][:image] if auth[:info][:image]
      elsif auth[:provider] == "google_oauth2"
        username = auth[:info][:first_name].concat(auth[:info][:last_name]).concat(auth[:extra][:raw_info][:sub].to_s[-3..-1])
        location = ""
        profile_photo = auth[:info][:image]
      end
      # Create the user if it's a new registration
      if user.nil?
        user = User.new(
          first_name: auth[:info][:first_name],
          last_name: auth[:info][:last_name],
          location: location,
          # name: auth.extra.raw_info.name,
          profile_photo: profile_photo,
          username: username,
          email: email ? email : "#{TEMP_EMAIL_PREFIX}-#{auth.uid}-#{auth.provider}.com",
          password: Devise.friendly_token[0,20]
        )
        user.save!
      end
    end

    # match identity to user
    if identity.user != user
      identity.user = user
      identity.save!
    end
    user
  end

  def email_verified?
    self.email && self.email !~ TEMP_EMAIL_REGEX
  end

  def karma_score
    reviews = Review.where(user_id: id)
    games = Game.where(user_id: id)
    user_xp = xp
    reviews.each do |review|
      user_xp += 1
      user_xp += review.vote_count
    end
    games.each do |game|
      user_xp += 1
    end
    self.xp = user_xp
  end

  def status
    if authority == "admin"
      return "admin"
    elsif authority == "mod"
      return "mod"
    end
    if xp < 25
      level = 0
      LEVEL[level]
    elsif xp < 50
      level = 1
      LEVEL[level]
    elsif xp < 75
      level = 2
      LEVEL[level]
    elsif xp < 100
      level = 3
      LEVEL[level]
    elsif xp < 150
      level = 4
      LEVEL[level]
    elsif xp < 200
      level = 5
      LEVEL[level]
    end
  end
end
