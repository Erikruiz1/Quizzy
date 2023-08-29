class Game < ApplicationRecord
  has_many :topics, through: :game_topics
  has_many :users, through: :game_participations
end
