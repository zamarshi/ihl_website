class Game < ApplicationRecord

  belongs_to :home_team, :class_name => "Team"
  belongs_to :away_team, :class_name => "Team"

  belongs_to :season, inverse_of: :games

  has_many :goals, dependent: :destroy

  has_many :players, through: :player_games, source: :player
  has_many :player_games, dependent: :destroy

  validates :date, presence: true,
                    uniqueness: true

  def add_team (t)
    team_games.create(game_id: t.id)
  end


    include AASM
    aasm whiny_transitions: false do
      state :scheduled, initial: true
      state :played
      state :canceled


      event :play do
        transitions from: :scheduled, to: :played
      end

      event :cancel do
        transitions from: :scheduled, to: :canceled
      end

      event :replay do
        transitions from: :played, to: :scheduled
      end

    end


end
