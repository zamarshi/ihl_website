class GamesController < ApplicationController

  before_action :find_game, except: [:new, :create, :index]

  def new
    @game = Game.new
  end

  def create
    @game = Game.new game_params
    @game.season = Season.find(params[:season_id])
    respond_to do |format|
      if @game.save
        format.js { render :success }
        format.html do
          redirect_to game_path(@game), notice: 'Game created!'
        end
      else
        format.js { render :create_failure }
      end
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
    @game = Game.find params[:id]
    respond_to do |format|
        season = @game.season
        @game.destroy
        format.html { redirect_to seasons_path, notice: 'Game deleted!' }
        format.js   { render } # destroy.js.erb
      end
    end

  def edit
    @home_team = @game.home_team
    @away_team = @game.away_team
  end

  def update
    if @game.update game_params
      @game.play if @game.goals.exists?
      @game.save
      flash[:notice] = 'Game updated'
      redirect_to game_path(@game)
    else
      flash.now[:alert] = 'Please see errors below!'
      render :edit
    end
  end

  private

  def game_params
    params.require(:game).permit([:id,
                                  :date,
                                  :season_id,
                                  :home_team_id,
                                  :away_team_id,
          goals_attributes: [:id, :team_id, :player_id, :_destroy,
          assists_attributes: [:id,:team_id,:player_id, :goal_id, :_destroy]
                                                                            ]])
  end

  def find_game
      @game = Game.find params[:id]
    end

end
