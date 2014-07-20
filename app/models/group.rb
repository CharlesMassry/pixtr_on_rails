class Group < ActiveRecord::Base
  has_many :group_memberships
  has_many :users, through: :group_memberships
  has_and_belongs_to_many :images
  has_many :likes, as: :content, dependent: :destroy
  has_many :hates, as: :hateable, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
