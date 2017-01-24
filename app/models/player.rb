class Player < ApplicationRecord
  has_many :assists
  has_many :goals

  has_many :player_teams, dependent: :nullify
  has_many :teams_played_for, through: :player_teams, source: :team

  has_many :player_games, dependent: :nullify
  has_many :games_played_by_player, through: :player_games, source: :game

  has_many :player_seasons, dependent: :nullify
  has_many :seasons, through: :player_seasons, source: :season

  def add_season (s)
    player_season.create(season_id: s.id)
  end

  def add_game (g)
    player_game.create(game_id: g.id)
  end

  def add_team (g)
    player_game.create(game_id: g.id)
  end

end
