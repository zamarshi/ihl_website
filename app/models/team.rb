class Team < ApplicationRecord
  belongs_to :season

  has_many :home_games, :class_name => "Game", :foreign_key => 'home_team_id'
  has_many :away_games, :class_name => "Game", :foreign_key => 'away_team_id'

  has_many :players, through: :player_teams, source: :player
  has_many :player_teams

  has_many :goals, dependent: :nullify

  # PaperClip Gem
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" },
                                      default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/

  def add_player (p)
    player_teams.create(player_id: p.id)
  end




end
