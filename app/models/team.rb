class Team < ApplicationRecord
  has_many :players
  has_many :season_schedules
  has_many :competitions, through: :season_schedules
end
