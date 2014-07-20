class Hate < ActiveRecord::Base
  validates :user_id, uniqueness: { scope: [:hateable_id, :hateable_type] }
  belongs_to :hateable, polymorphic: true
  belongs_to :user
end
