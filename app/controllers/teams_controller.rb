class TeamsController < ApplicationController

  def edit
    @team = Team.find(params[:id])
    @players = Players.where.not(id: @team.player_ids)
  end

  def update
    
  end


end
