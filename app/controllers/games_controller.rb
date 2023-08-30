class GamesController < ApplicationController
  def new
    @game = Game.new
    @topics = Topic.all
    @users = User.all
  end

  def create
    @game = Game.create(game_params)
    topics_string = " "

    params[:game][:topics].each do |topic|
      unless topic == ""
        @game_topic = GameTopic.create(game_id: @game.id, topic_id: topic) unless topic == ""
        topics_string = topics_string + @game_topic.topic.name + " "
      end
    end

    GameParticipation.create(game_id: @game.id, user_id: current_user.id)
    count = 0
    service = OpenaiService.new(build_prompt)
    @response = service.call
    @game.number_of_questions.times do
      @question = Question.new(QUESTIONS_DATA[count])
      @question.game = @game
      count += 1
      @question.save
    end
    
    redirect_to game_path(@game)
  end

  def show
    @game = Game.find(params[:id])
    if params[:prompt]
      service = OpenaiService.new(params[:prompt])
      @response = service.call
    end
  end

  private

  def build_prompt
    "Generate a JSON with #{@game.number_of_questions}
      questions, they should not be multiple choice questions.
      Include a key for the 'topics' #{topics_string}.
      Include a key for 'difficulty' #{@game.difficulty} out of 10.
      Include a key for the 'right_answer'.
      Include a key for the 'hint'."
  end

  def game_params
    params.require(:game).permit(:topics, :difficulty, :number_of_questions)
  end
end

QUESTIONS_DATA = [
  { content: "What is the capital city of France?", answer: "Paris" },
  { content: "Which country has the capital city called Tokyo?", answer: "Japan" },
  { content: "Which ancient civilization built pyramids and worshipped the god Ra?", answer: "Ancient Egyptians" },
  { content: "The Colosseum, a large stadium built by the Romans, is located in which modern-day country?", answer: "Italy" },
  { content: "Who painted the Mona Lisa?", answer: "Leonardo da Vinci" },
  { content: 'Which artist painted "The Starry Night"?', answer: "Vincent van Gogh" },
  { content: "Who is credited with the popular design of the light bulb, even though he improved upon earlier designs?", answer: "Thomas Edison" },
  { content: "Who invented the telephone?", answer: "Alexander Graham Bell" },
  { content: "The Wright brothers are famous for their pioneering work in which field?", answer: "Aviation (or flying/making airplanes)" },
  { content: "Who is the famous scientist who developed the theory of relativity?", answer: "Albert Einstein" }
]
