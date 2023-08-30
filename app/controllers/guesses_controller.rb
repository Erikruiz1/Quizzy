class GuessesController < ApplicationController
  def create
    @guess = Guess.new(guess_params)
    @guess.user = current_user
      if @guess.save

        # Handle successful save - e.g., redirect with a success message
      else
        # Handle failure - e.g., render the 'show' template with error messages
      end
  end

  private

  def guess_params
      params.require(:guess).permit(:content, :question_id)
  end

end
