class Team < ApplicationRecord
  belongs_to :season
  has_many :games_played_by_team, through: :team_games, source: :game
  has_many :players_on_team, through: :player_teams, source: :player
  has_many :goals, dependent: :nullify

end
