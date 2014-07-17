class Like < ActiveRecord::Base
  validates :user_id, uniqueness: { scope: [:content_id, :content_type]  }
  belongs_to :user
  belongs_to :content, polymorphic: true
end
