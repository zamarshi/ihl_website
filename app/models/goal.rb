class Goal < ApplicationRecord
  belongs_to :player
  belongs_to :team
  belongs_to :game
  has_many :assists
end
