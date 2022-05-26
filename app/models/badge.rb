class Badge < ApplicationRecord
  has_many :users, through: :awards
  has_many :awards, dependent: :destroy

  validates :title, presence: true
  validates :image_url, presence: true
  validates :rule, presence: true
end