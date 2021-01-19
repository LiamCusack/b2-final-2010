class Player < ApplicationRecord
  belongs_to :team
  has_many :season_schedules, through: :team
end
