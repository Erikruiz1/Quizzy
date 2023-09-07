
class GuessesController < ApplicationController
  def create
    @guess = Guess.new(guess_params)
    @guess.user = current_user
    if @guess.save
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
        @guess.question.save
      end

      @guess.correct = @data["is_close"]
      @guess.save
      redirect_to answer_game_path(@guess.question.game)
    else
      @display_states = progress_bar(@guess.question.game)
      @question = @guess.question
      @game = @question.game
      render "games/show", status: :unprocessable_entity
    end

  end

  private

  def build_prompt(guess)
    "Here we have a question: #{@guess.question.content},
    and a guess to the answer: #{guess.content}.
    Return three keys in JSON format: \"is_close\", \"hint\", \"elaborate\".
    If the guess is not close enough to the correct answer \"is_close\" is false
    and, based on the guess, give a specific \"hint\" to help the user guess the correct answer.
    If the guess is close enough to the correct answer \"is_close\" is true
    and \"elaborate\" why it is close enough in one sentence."
  end

  def guess_params
      params.require(:guess).permit(:content, :question_id)
  end

  def progress_bar(game)
    display_states = []
    game.questions.order(:id).each do |q|
      unless q.guesses.empty?
        q.guesses.last.correct == true ? display_states.push("correct") : display_states.push("incorrect")
      else
        display_states.push("empty")
      end
    end
    display_states
  end
end
