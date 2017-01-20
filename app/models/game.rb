class Game < ApplicationRecord
  belongs_to :season
  has_many :goals, dependent: :destroy
  has_many :team_games, through: :team_games, source: :team
  
end
