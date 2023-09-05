class Guess < ApplicationRecord
  belongs_to :question
  belongs_to :user
  validates :content, presence: true
end
