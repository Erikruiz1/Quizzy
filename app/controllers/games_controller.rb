class GamesController < ApplicationController
  def new
    @no_navbar_container = true
    @game = Game.new
    @topics = Topic.all
    @users = User.all
    @topic = Topic.new
  end

  def create
    @no_footer = true
    @game = Game.create(game_params)
    topics = []
    topics_string = ""
    params[:game][:topics].each do |topic|
      unless topic == ""
        @game_topic = GameTopic.create(game_id: @game.id, topic_id: topic) unless topic == ""
        # topics_string = topics_string + @game_topic.topic.name + ", ".strip
        topics << @game_topic.topic.name
      end
      topics_string = topics.join(", ")
    end

    GameParticipation.create(game_id: @game.id, user_id: current_user.id)
    service = OpenaiService.new(build_prompt(topics_string))
    @response = service.call
    @data = JSON.parse(@response)
    failed = false
    count = 0
    @game.number_of_questions.times do
      question = Question.new(content:@data["questions"][count]["question"], answer: @data["questions"][count]["right_answer"])
      count += 1
      question.game = @game
      unless question.save
        failed = true
        @game.destroy
        break
      end
    end

    redirect_to new_game_path, alert: "Something went wrong when creating the game!" if failed
    redirect_to game_path(@game)
  end

  def show
    @no_footer = true
    @game = Game.find(params[:id])
    @guess = Guess.new
    @display_states = progress_bar(@game)
    @question = find_question(@game)
    @guesses_left = 0
    if @question.nil?
      @game.completed = true
      @game.save
      redirect_to summary_game_path(@game)
    else
      unless @question.guesses.empty?
        @guesses_left = 3 - @question.guesses.size
      else
        @guesses_left = 3
      end
    end
    @guesses_plural = @guesses_left > 1 ? "guesses" : "guess"
  end

  def answer
    @no_footer = true
    @game = Game.find(params[:id])
    # Improvement for multiuser
    @guess = current_user.guesses.last
    @question = @guess.question
    @count = @question.guesses.all.size
    @hint = current_user.hints.last
    @display_states = progress_bar(@game)
    @guesses_left = 0
    unless @question.guesses.empty?
      @guesses_left = 3 - @question.guesses.size
    else
      @guesses_left = 3
    end
    @next_question = find_question(@game)
    if @next_question.nil?
      @game.completed = true
      @game.save
    end
    @guesses_plural = @guesses_left > 1 ? "guesses" : "guess"
  end

  def summary
    @game = Game.find(params[:id])
    @questions = @game.questions
    @correct_questions = 0
    @number_of_guesses = 0
    @questions.each do |question|
      guesses_count = 0
      question.guesses.each do |guess|
        guesses_count += 1
        if guess.correct == true
          @correct_questions += 1
          @number_of_guesses += guesses_count
        end
      end
    end
    @correct_any = true
    if @correct_questions != 0
      @guesses_per_correct_answer = (@number_of_guesses.to_f / @correct_questions).round(1)
    else
      @correct_any = false
    end
  end

  def add_guesses
    @game = Game.find(params[:id])
    @question = find_question(@game)
    (3 - @question.guesses.size).times do
      @guess = Guess.new()
      @guess.user = current_user
      @guess.question = @question
      @guess.save(validate: false)
    end
    redirect_to game_path(@game)
  end



  private

  def find_question(game)
    game.questions.find do |q|
      count = 0
      q.guesses.all? do |guess|
        count += 1
        !guess.correct && count < 3
      end
    end
  end

  def build_prompt(topics_string)
    "Generate a JSON with #{@game.number_of_questions}
      questions, they should not be multiple choice questions. Include a key for the \"questions\".
      The questions should require open ended answers to make it more challenging.
      Include a key for the \"topics\" #{topics_string},
      you can also mix different topics in a single question.
      #{QUIZ_DIFFICULTY[@game.difficulty - 1]}.
      Include a key for the \"right_answer\".
      Include a key for the \"hint\"."
  end

  def game_params
    params.require(:game).permit(:topics, :difficulty, :number_of_questions)
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

QUIZ_DIFFICULTY =
["the questions should be suited for children aged 7 to 14 so please make the questions very easy to answer",
"the questions should be suited for children and adults alike so please make the questions challenging to answer",
"the questions should be suited for adult experts in the above topics so please make the questions very difficult to answer."]
