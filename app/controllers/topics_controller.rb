class TopicsController < ApplicationController
  def create
    Topic.create(topic_params)
    redirect_to new_game_path
  end

  def topic_params
    params.require(:topic).permit(:name, :category)
  end
end
