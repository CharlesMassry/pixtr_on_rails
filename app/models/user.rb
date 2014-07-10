class User < ActiveRecord::Base
  has_many :galleries

  has_many :group_memberships
  has_many :groups, through: :group_memberships

  has_many :liked_images, through: :likes, source: :image
  has_many :likes

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  def member?(group)
    groups.include?(group)
  end

  def join(group)
    groups << group
  end

  def leave(group)
    groups.delete(group)
  end

  def not_liked?(image)
    liked?(image) == false
  end

  def liked?(image)
    liked_images.include?(image)
  end
end
