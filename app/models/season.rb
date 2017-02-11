class Season < ApplicationRecord
  has_many :player_seasons, dependent: :nullify
  has_many :players, through: :player_seasons, source: :player
  has_many :teams, inverse_of: :season, dependent: :nullify
  has_many :games, inverse_of: :season, dependent: :nullify
  accepts_nested_attributes_for :games, allow_destroy: true
  accepts_nested_attributes_for :teams, allow_destroy: true

end
