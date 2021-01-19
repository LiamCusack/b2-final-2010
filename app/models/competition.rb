class Competition < ApplicationRecord
  has_many :season_schedules
  has_many :teams, through: :season_schedules
  has_many :players, through: :teams

  def average_player_age
    players.average(:age)
  end
end
