class GamesController < ApplicationController
  # before_action :authenticate_user, except: [:index, :show]

  def new
    @game = Game.new
  end

  def create
    
    @game = Game.new params.require(:game).permit([:date,
                                      team_ids: []])

      if @game.save
        flash[:notice] = 'Game Created!'
        redirect_to new_game_path(@game)
      else
      flash.now[:alert] = 'Please see errors below'
      redirect_to new_game_path(@game)
      end
  end

  def destroy

  end

  def edit
  end

end
