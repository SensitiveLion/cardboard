class Tag < ActiveRecord::Base
  before_validation :downcase_tag_name

  has_many :game_tags, dependent: :destroy
  validates :name, presence: true, uniqueness: true

  private

  def downcase_tag_name
    :name.downcase!
  end
end
