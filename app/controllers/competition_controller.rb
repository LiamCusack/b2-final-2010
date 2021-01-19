class CompetitionController < ApplicationController
  before_action :set_competition, only: [:show]
  def index
    @competitions = Competition.all
  end

  def show
  end

  def competition_params
    params.require(:competition).permit(:name)
  end

  def set_competition
    @competition = Competition.find(params[:id])
  end

end
