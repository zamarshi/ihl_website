class Goal < ApplicationRecord
  belongs_to :player
  belongs_to :team
  has_many :assists
end
