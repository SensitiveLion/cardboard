class Tag < ActiveRecord::Base
  has_many :game_tags, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
