class TeamsController < ApplicationController

  def edit
    @player_team = PlayerTeam.new
    @player = Player.new
    @team = Team.find(params[:id])
    @players = Player.where.not(id: @team.player_ids)
  end

  def update

  end


end
