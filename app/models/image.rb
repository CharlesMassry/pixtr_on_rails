class Image < ActiveRecord::Base
  belongs_to :gallery

  has_and_belongs_to_many :groups

  has_many :comments
  has_many :likes, as: :content, dependent: :destroy
  has_many :hates, as: :hateable, dependent: :destroy

  acts_as_taggable

  validates :name, presence: true
  validates :description, presence: true
  validates :url, presence: true

  def liked_count
    Like.where(content_id: self.id).size
  end

  def hated_count
    Hate.where(hateable_id: self.id).size
  end
end
