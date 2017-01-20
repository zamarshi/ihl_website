class Player < ApplicationRecord
  has_many :assists
  has_many :goals
  has_many :teams_played_for, through: :player_teams, source: :team
  has_many :games_played_by_player, through: :player_games, source: :game
  has_many :seasons_played_by_player, through: :player_seasons, source: :season

end
