class Player < ApplicationRecord
  has_many :assists
  has_many :goals

  has_many :player_teams, dependent: :nullify
  has_many :teams_played_for, through: :player_teams, source: :team

  has_many :player_games, dependent: :nullify
  has_many :games_played_by_player, through: :player_games, source: :game

  has_many :player_seasons, dependent: :nullify
  has_many :seasons, through: :player_seasons, source: :season

  belongs_to :user, :foreign_key => 'user_id'

  def add_season (s)
    player_seasons.create(season_id: s.id)
  end

  def add_game (g)
    player_games.create(game_id: g.id)
  end

  def add_team (t)
    player_teams.create(game_id: t.id)
  end

end
