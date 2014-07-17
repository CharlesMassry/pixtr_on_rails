class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :image
  has_many :likes, as: :content, dependent: :destroy

  default_scope { order(created_at: :asc) }
end
