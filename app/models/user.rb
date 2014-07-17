class User < ActiveRecord::Base
  has_many :galleries

  has_many :group_memberships
  has_many :groups, through: :group_memberships

  has_many :likes
  has_many :stalkers, as: :content, class_name: "Like", dependent: :destroy

  has_many :hates
  has_many :hated_images, through: :hates, source: :image

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

  def not_liked?(content)
    liked?(content) == false
  end

  def liked?(content)
    likes.where(content: content).empty?
  end

  def not_hated?(image)
    hated?(image) == false
  end

  def hated?(image)
    hated_images.include?(image)
  end

end
