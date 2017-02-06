class Season < ApplicationRecord

  has_many :player_seasons, dependent: :nullify
  has_many :players, through: :player_seasons, source: :player

  has_many :games, dependent: :nullify
end
