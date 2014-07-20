class User < ActiveRecord::Base
  has_many :galleries

  has_many :group_memberships
  has_many :groups, through: :group_memberships

  has_many :likes
  has_many :stalkers, as: :content, class_name: "Like", dependent: :destroy

  has_many :hates
  has_many :haters, as: :hateable, class_name: "Hate", dependent: :destroy

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

  def not_hated?(hate)
    hated?(hate) == false
  end

  def hated?(hate)
    hates.where(hateable: hate).empty?
  end

end
