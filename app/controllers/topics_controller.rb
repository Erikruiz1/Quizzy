class TopicsController < ApplicationController
  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to new_game_path
    else
      @game = Game.new 
      render "/games/new", status: :unprocessable_entity
    end
  end

  def topic_params
    params.require(:topic).permit(:name, :category)
  end
end
