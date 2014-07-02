class Gallery < ActiveRecord::Base
  has_many :images, dependent: :destroy
  validates :name, presence: :true
  validates :description, presence: :true
end
