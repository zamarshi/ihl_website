class SeasonsController < ApplicationController

  before_action :find_season, only: [:edit, :update, :destroy, :show]
  def new
    @season = Season.new
    @team = Team.new
  end

  def create
    @season = Season.new season_params
    if @season.save
      redirect_to edit_season_path(@season), notice: 'Season Created'
    else
      puts @season.errors.full_messages.join(', ')
      flash.now[:alert] = 'Please see errors below'
      render :new
    end
  end

  def edit
  end

  def update
    if @season.update season_params
      redirect_to root_path, notice: 'Season Created'
    else
      puts @season.errors.full_messages.join(', ')
      flash.now[:alert] = 'Please see errors below'
      redirect_to new_season_path( @season)
    end
  end

  def show
    @game = Game.new
    respond_to do |format|
      format.html { render }
      format.json { render json: @season.to_json }
  end
  end

  def destroy
  end

  def index
    @seasons = Season.all
    if params[:game] && (params[:game][:season_id] != '')
      @games = Game.where(season_id: params[:game][:season_id])
      @season = Season.find(params[:game][:season_id])
    else
      @games = Game.where(season: current_season)
      @season = current_season
    end
  end


  def schedule
    if params[:game] && (params[:game][:season_id] != '')
      @season = Season.find(params[:game][:season_id])
    else
      @games = Game.where(season: current_season)
      @season = current_season
    end
  end

  def list_teams
    if params[:team] && (params[:team][:season_id] != '')
      @season = Season.find(params[:team][:season_id])
    else
      @teams = Team.where(season: current_season)
      @season = current_season
  end
end
  private

    def season_params
      params.require(:season).permit(:name,
                                      games_attributes: [:id, :date,
                                                         :home_team_id,
                                                         :away_team_id,
                                                         :_destroy],
                                      teams_attributes: [:id, :name, :avatar,
                                                                    :_destroy])
    end

    def find_season
      @season = Season.find params[:id]
    end

end
