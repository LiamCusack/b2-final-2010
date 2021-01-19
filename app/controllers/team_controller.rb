class TeamController < ApplicationController
  before_action :find_competition, only: [:new]

  def new
  end

  def create
    @competition.teams.create!(team_params_create)
    redirect_to "competition/#{@competition.id}"
  end

  private
  def team_params
    params.require(:team).permit(:nickname, :hometown, :competition_id)
  end

  def team_params_create
    params.permit(:nickname, :hometown)
  end

  def find_team
    @team = Team.find(params[:id])
  end

  def find_competition
    @competition = Competition.find(params[:competition_id])
  end
end
