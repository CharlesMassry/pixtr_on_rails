class Like < ActiveRecord::Base
  validates :user_id, uniqueness: { scope: [:content_id, :content_type]  }
  validate :user_cant_like_himself
  belongs_to :user
  belongs_to :content, polymorphic: true

  def user_cant_like_himself
    if self.content_type == "User"
      if self.content_id == self.user_id
        errors.add(:user_id, "You can't like yourself")
      end
    end
  end

end
