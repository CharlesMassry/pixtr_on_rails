class Like < ActiveRecord::Base
  validates :user_id, uniqueness: { scope: :image_id }
  belongs_to :user
  belongs_to :image
end
