class Game < ApplicationRecord
  has_many :game_topics, dependent: :destroy
  has_many :game_participations, dependent: :destroy
  has_many :questions, dependent: :destroy
  has_many :topics, through: :game_topics
  has_many :users, through: :game_participations
end
