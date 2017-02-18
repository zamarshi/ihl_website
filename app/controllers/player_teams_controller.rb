class PlayerTeamsController < ApplicationController



  def create
    @team = Team.find(params[:player_team][:team_id])
    @player = Player.find(params[:player_team][:player_id])
    @player_team = PlayerTeam.new player_team_params
    respond_to do |format|
      if @player_team.save
        format.js { render :add_player_success }
        format.html do
          # redirect_to team_path(@team), notice: 'Game created!'
        end
      else
        format.js { render :failure }
      end
    end
  end


  def destroy
    @player_team = PlayerTeam.find params[:id]
    @player = @player_team.player
    respond_to do |format|
        @player_team.destroy
        format.html { redirect_to seasons_path,
          notice: 'Player Removed from #{@player_team.team.name}' }
        format.js   { render } # destroy.js.erb
      end
    end



private

  def player_team_params
    params.require(:player_team).permit([:team_id,
                                  :player_id])
  end

end
