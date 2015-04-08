class User < ActiveRecord::Base
  has_many :reviews
  has_many :games
  has_many :comments
  has_many :votes

  mount_uploader :profile_photo, ProfilePhotoUploader

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  def has_authority?
    authority == "admin" || authority == "mod"
  end

  TEMP_EMAIL_REGEX = /\Achange@me/
  TEMP_EMAIL_PREFIX = 'change@me'

  # Include default devise modules. Others available are:
  # :lockable, :timeoutable

  #validates_format_of :email, :without => TEMP_EMAIL_REGEX, on: :update

  def self.find_for_oauth(auth, signed_in_resource = nil)

    # Get the identity and user if they exist
    identity = Identity.find_for_oauth(auth)

    # If a signed_in_resource is provided it always overrides the existing user
    # to prevent the identity being locked with accidentally created accounts.
    # Note that this may leave zombie accounts (with no associated identity) which
    # can be cleaned up at a later date.
    user = signed_in_resource ? signed_in_resource : identity.user

    # Create the user if needed
    if user.nil?

      #check for email exists and verified -- facebook email ------------- google email
      email_is_verified = auth.info.email && (auth.info.verified || auth.extra.raw_info.email_verified)
      email = auth.info.email if email_is_verified
      user = User.where(email: email).first if email

      if auth.provider == "facebook"
        location = (auth.extra.raw_info.locale[-2..-1])
        username = auth.info.first_name.concat(auth.info.last_name).concat(auth.extra.raw_info.id[-3..-1])
      else
        username = auth.info.first_name.concat(auth.info.last_name).concat(auth.extra.raw_info.sub[-3..-1])
        location = ""
      end
      # Create the user if it's a new registration
      if user.nil?
        user = User.new(
          first_name: auth.info.first_name,
          last_name: auth.info.last_name,
          location: location,
          #name: auth.extra.raw_info.name,
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
end
