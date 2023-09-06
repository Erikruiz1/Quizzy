class Topic < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :category, presence: true
  has_one_attached :photo
end
