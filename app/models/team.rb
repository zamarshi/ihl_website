class Team < ApplicationRecord
  belongs_to :season

  has_many :games, through: :team_games, source: :game
  has_many :team_games

  has_many :players, through: :player_teams, source: :player
  has_many :player_teams

  has_many :goals, dependent: :nullify

  def add_game(g)
    team_games.create(game_id: g.id)
  end

  def add_player (p)
    player_teams.create(player_id: p.id)
  end

end
