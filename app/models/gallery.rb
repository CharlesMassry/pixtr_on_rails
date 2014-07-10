class Gallery < ActiveRecord::Base
  has_many :images, dependent: :destroy
  belongs_to :user
  validates :name, presence: true
  validates :description, presence: true
end
