class GamesController < ApplicationController
  # before_action :authenticate_user, except: [:index, :show]

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
    if params[:game] && params[:game][:season_id]
      @games = Game.where(season_id: params[:game][:season_id])
    else
      @games = Game.where(season: current_season)
    end
  end

  def show
    @game = 
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

end
