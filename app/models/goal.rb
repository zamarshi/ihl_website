class Goal < ApplicationRecord
  belongs_to :player
  belongs_to :team
  belongs_to :game
  has_many :assists, inverse_of: :goal, dependent: :nullify
  accepts_nested_attributes_for :assists, :allow_destroy => true

end
