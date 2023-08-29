class Game < ApplicationRecord
  has_many :game_topics
  has_many :game_participations
  has_many :questions
  has_many :topics, through: :game_topics
  has_many :users, through: :game_participations
end
