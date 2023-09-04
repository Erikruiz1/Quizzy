class Topic < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :category, presence: true
end
