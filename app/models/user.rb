class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :game_participations
  has_many :games, through: :game_participations
  has_many :guesses
  has_many :hints
  devise :database_authenticatable, :registerable,
        :recoverable, :rememberable, :validatable
end
