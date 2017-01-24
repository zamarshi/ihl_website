class Game < ApplicationRecord
  belongs_to :season

  has_many :goals, dependent: :destroy

  has_many :players, through: :player_games, source: :player
  has_many :player_games, dependent: :destroy

  has_many :team_games, dependent: :destroy
  has_many :teams, through: :team_games, source: :team
end
