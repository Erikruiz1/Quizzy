class UsersController < ApplicationController

  def show
    @games = current_user.games
    
  end

end
