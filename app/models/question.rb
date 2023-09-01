class Question < ApplicationRecord
  belongs_to :game
  has_many :hints
  has_many :guesses
end
