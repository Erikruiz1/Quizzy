
class GuessesController < ApplicationController
  def create
    @guess = Guess.new(guess_params)
    @guess.user = current_user
    service = OpenaiService.new(build_prompt(@guess))
    @response = service.call
    @data = JSON.parse(@response)

    if @data["is_close"] == false
      @hint = Hint.new(content: @data["hint"])
      @hint.user = current_user
      @hint.question = @guess.question
      @hint.save
    else
      @guess.question.elaborate = @data["elaborate"]
    end

    @guess.correct = @data["is_close"]
    @guess.save

    redirect_to game_path(@guess.question.game)
  end

  private

  def build_prompt(guess)
    "Here we have a question: #{@guess.question.content}
    and a guess to the answer: #{guess.content}.
    Return three keys in JSON format: 'is_close', 'hint', 'elaborate'.
    If the guess is not close enough to the correct answer 'is_close' is false
    and, based on the guess, give a 'hint' to help the user guess the correct answer.
    If the guess is close enough to the correct answer 'is_close' is true
    and 'elaborate' why it is close enough in one sentance."
  end

  def guess_params
      params.require(:guess).permit(:content, :question_id)
  end

end
