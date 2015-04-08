class Identity < ActiveRecord::Base
  belongs_to :user
  validates :uid, presence: :provider
  validates :uid, uniqueness: { scope: :provider }

  def self.find_for_oauth(auth)
    find_or_create_by(uid: auth.uid, provider: auth.provider)
  end
end
