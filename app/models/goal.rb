class Goal < ApplicationRecord
  belongs_to :player
  belongs_to :team
  belongs_to :game
  has_many :assists
  accepts_nested_attributes_for :assists, :allow_destroy => true

end
