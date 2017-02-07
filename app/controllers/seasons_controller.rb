class SeasonsController < ApplicationController

  def new
    @season = Season.new
  end

  def create
    @season = Season.new season_params
    if @season.save
      redirect_to root_path, notice: 'Season Created'
    else
      puts @season.errors.full_messages.join(', ')
      flash.now[:alert] = 'Please see errors below'
      redirect_to new_season_path(@season)

    end

  end

  def edit
  end

  def show
  end

  def destroy
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


  private
    def season_params
      params.require(:season).permit(:name, games_attributes: [:id, :date,
                                                              :home_team_id,
                                                              :away_team_id,
                                                              :_destroy])
    end


end
