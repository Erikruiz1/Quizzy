class GameTopic < ApplicationRecord
  belongs_to :game
  belongs_to :topic
end
