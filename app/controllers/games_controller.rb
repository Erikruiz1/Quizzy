class GamesController < ApplicationController
  def new
    @game = Game.new
    @topics = Topic.all
  end

  def create

  end

  def show

  end
end
