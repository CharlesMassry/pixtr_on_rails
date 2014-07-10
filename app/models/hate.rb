class Hate < ActiveRecord::Base
  validates :user_id, uniqueness: { scope: :image_id }
  belongs_to :image
  belongs_to :user
end
