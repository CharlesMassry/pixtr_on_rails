class Like < ActiveRecord::Base
  validates :user_id, uniqueness: { scope: [:content_id, :content_type]  }
  validate :user_cannot_like_self
  belongs_to :user
  belongs_to :content, polymorphic: true

  def user_cannot_like_self
    if content == user
        errors.add(:user_id, "You can't like yourself")
    end
  end

end
