class Team < ApplicationRecord
  belongs_to :season

  has_many :home_games, :class_name => "Game", :foreign_key => 'home_team_id'
  has_many :away_games, :class_name => "Game", :foreign_key => 'away_team_id'

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
