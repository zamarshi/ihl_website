class Game < ApplicationRecord

  belongs_to :home_team, :class_name => "Team"
  belongs_to :away_team, :class_name => "Team"

  belongs_to :season

  has_many :goals, dependent: :destroy

  has_many :players, through: :player_games, source: :player
  has_many :player_games, dependent: :destroy

  def add_team (t)
    team_games.create(game_id: t.id)
  end


end
