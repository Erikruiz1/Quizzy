class GamesController < ApplicationController
  def new
    @game = Game.new
    @topics = Topic.all
    @users = User.all
  end

  def create
    @game = Game.create(game_params)
    params[:game][:topics].each do |topic|
      GameTopic.create(game_id: @game.id, topic_id: topic) unless topic == ""
    end
    GameParticipation.create(game_id: @game.id, user_id: current_user.id)
    redirect_to game_path(@game)
  end

  def show
    @game = Game.find(params[:id])
  end

  private

  def game_params
    params.require(:game).permit(:topics, :difficulty, :number_of_questions)
  end
end
