class GamesController < ApplicationController
  def new
    @game = Game.new
    @topics = Topic.all
    @users = User.all
    @topic = Topic.new
  end

  def create
    @game = Game.create(game_params)
    topics_string = " "

    params[:game][:topics].each do |topic|
      unless topic == ""
        @game_topic = GameTopic.create(game_id: @game.id, topic_id: topic) unless topic == ""
        topics_string = topics_string + @game_topic.topic.name + ", "
      end
    end

    GameParticipation.create(game_id: @game.id, user_id: current_user.id)
    service = OpenaiService.new(build_prompt(topics_string))
    @response = service.call
    @data = JSON.parse(@response)
    @data["questions"].each do |question|
      @question = Question.new(content:question["question"], answer: question["right_answer"])
      @question.game = @game
      @question.save
    end

    redirect_to game_path(@game)
  end

  def show
    @game = Game.find(params[:id])
    @guess = Guess.new
    @question = @game.questions.find do |q|
      count = 0
      q.guesses.all? do |guess|
        count += 1
        !guess.correct && count < 3
      end
    end
    if @question.nil?
      redirect_to new_game_path
    end
  end

  def answer
    @game = Game.find(params[:id])
    # Improvement for multiuser
    @guess = current_user.guesses.last
    @question = @guess.question
    @count = @question.guesses.all.size
    @hint = current_user.hints.last
  end

  private

  def build_prompt(topics_string)
    "Generate a JSON with #{@game.number_of_questions}
      questions, they should not be multiple choice questions.
      The questions should require open ended answers to make it more challenging.
      Include a key for the 'topics' #{topics_string},
      you can also mix different topics in a single question.
      #{QUIZ_DIFFICULTY[@game.difficulty - 1]}.
      Include a key for the 'right_answer'.
      Include a key for the 'hint'."
  end

  def game_params
    params.require(:game).permit(:topics, :difficulty, :number_of_questions)
  end
end

QUIZ_DIFFICULTY = ["the questions should be suited for children aged 7 to 14 so please make the questions very easy to answer",
                  "the questions should be suited for children and adults alike so please make the questions challenging to answer",
                  "the questions should be suited for adult experts in the above topics so please make the questions very difficult to answer."]
