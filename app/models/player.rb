class Player < ApplicationRecord
  has_secure_password
  acts_as_messageable
  has_many :player_games
  has_many :games, through: :player_games  
end
