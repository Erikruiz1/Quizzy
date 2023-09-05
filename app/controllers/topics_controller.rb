class TopicsController < ApplicationController
  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      respond_to do |format|
        format.html { redirect_to user_path(current_user) }
        format.text { render(partial: "shared/topic_card", formats: :html, locals: { topic: @topic }) }
      end
    else
      @game = Game.new
      @user = current_user
      render "users/show", status: :unprocessable_entity
    end
  end

  def topic_params
    params.require(:topic).permit(:name, :category)
  end
end
