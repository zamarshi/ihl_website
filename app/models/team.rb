class Team < ApplicationRecord
  belongs_to :season
  has_many :games, foreign_key: :team_id
  has_many :home_games, :class_name => "Game", :foreign_key => 'home_team_id'
  has_many :away_games, :class_name => "Game", :foreign_key => 'away_team_id'
  has_many :won_games, :class_name => "Game", :foreign_key => 'winning_team_id'
  has_many :lost_games, :class_name => "Game", :foreign_key => 'losing_team_id'

  has_many :players, through: :player_teams, source: :player
  has_many :player_teams

  has_many :goals, dependent: :nullify

  # PaperClip Gem
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" },
                                      default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  validates :name, presence: true


  def add_player (p)
    player_teams.create(player_id: p.id)
  end

  def home_games_played(season)
    home_games.where(season: season).count
  end

  def away_games_played(season)
    away_games.where(season: season).count
  end


  def games_played(season)
    home_games_played(season) + away_games_played(season)
  end

  def points (season)
    points = (3*regulation_wins(season)) + (2*overtime_wins(season)) + (overtime_losses(season))
  end

  def regulation_wins (season)
    won_games.where(season: season, overtime: [false, nil]).count
  end

  def regulation_losses (season)
    lost_games.where(season: season, overtime: [false,nil]).count
  end

  def overtime_wins (season)
    won_games.where(season: season, overtime: true).count
  end

  def overtime_losses (season)
    lost_games.where(season: season, overtime: true).count
  end


end
