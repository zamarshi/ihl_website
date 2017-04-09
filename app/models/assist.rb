class Assist < ApplicationRecord
  belongs_to :goal
  belongs_to :player
  belongs_to :team

end
