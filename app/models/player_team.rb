class PlayerTeam < ApplicationRecord
  belongs_to :player
  belongs_to :team
  validates :player_id, uniqueness: { scope: :team_id }
end
