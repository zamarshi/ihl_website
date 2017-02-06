class GamesController < ApplicationController

  before_action :find_game, except: [:new, :create, :index]

  def new
    @game = Game.new
  end

  def create
    @game = Game.new game_params
      if @game.save
        redirect_to root_path, notice: 'Game Created'

      else
        flash.now[:alert] = 'Please see errors below'
        redirect_to new_game_path(@game)
      end
  end


  def index
    if params[:game] && (params[:game][:season_id] != '')
      @games = Game.where(season_id: params[:game][:season_id])
      @season = Season.find(params[:game][:season_id])
    else
      @games = Game.where(season: current_season)
      @season = current_season
    end
  end

  def show
    @goals = Goal.where(game: @game)
    @home_team_goals = Goal.where(game: @game, team: @game.home_team)
    @away_team_goals = Goal.where(game: @game, team: @game.away_team)
  end

  def destroy
  end

  def edit
  end

  private

  def game_params
    params.require(:game).permit([:date,
                                  :season_id,
                                  :home_team_id,
                                  :away_team_id])
  end

  def find_game
      @game = Game.find params[:id]
    end

end
